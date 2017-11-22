# encoding: UTF-8
module Sal7711Gen
  module ApplicationHelper

    include ::FontAwesome::Rails::IconHelper
    include Sip::PaginacionAjaxHelper

    def desc_bitacora(entrada)
      r = ''
      if !entrada[:buscar]
        return ''
      end
      if ( (entrada[:buscar]['fechaini']  && entrada[:buscar][:fechaini] != '') ||
         (entrada[:buscar]['fechafin'] && entrada[:buscar]['fechafin'] != '') )
        r += "Fecha: #{entrada[:buscar]['fechaini']} - " +
          "#{entrada[:buscar]['fechafin']}. "
      end
      if (entrada[:buscar]['mundep'] && entrada[:buscar]['mundep'] != '')
        r += "Muncipio/Departamento: #{entrada[:buscar]['mundep']}. "
      end
      if (entrada[:buscar]['categoria'] && entrada[:buscar]['categoria'] != '')
        r += "Categoria: #{entrada[:buscar]['categoria']}. "
      end
      if (entrada[:buscar]['fuente'] && entrada[:buscar]['fuente'] != '')
        f = Sip::Fuenteprensa.find(entrada[:buscar]['fuente'])
        if f
          r += "Fuente: #{f.nombre}. "
        end
      end
      if  (entrada[:buscar]['pagina'] && entrada[:buscar]['pagina'] != '')
        r += "Página: #{entrada[:buscar]['pagina']}. "
      end
      
      return r
    end

    def buscar_mostraruno(id)
      Rails.configuration.relative_url_root + "buscar/#{id.to_s}"
    end

    # Retorna datos del articulo con la id dada en un vector con:
    # 0- titulo
    # 1- texto
    # 2- rlocal Ruta a fuente (e.g TIF) en sistema de archivos
    # 3- rutajpg Pathname al jpg en colchón en sistema de archivos
    # 4- urljpg Pathname con url relativo al jpg de colchón
    # 5- rutapdf Pathname al pdf en colchón en sistema de archivos
    # 6- urlpdf Pathname con url relativo al pdf en colchón
    def datos_articulo(id) 
      a = Articulo.where("sal7711_gen_articulo.id = ?", id).take
      rlocal = Pathname.new(a.ruta_articulo)
      rutapublic = Rails.root.join('public')
      urlcolchon = Rails.application.config.x.url_colchon.to_s
      rutacolchon = rutapublic.join(urlcolchon)
      if (!File.exists? rutacolchon.to_s)
        raise "Crear directorio #{rutacolchon.to_s}"
      end
      titulo = a.adjunto_descripcion
      texto = a.texto
      anioc = a.created_at.year
      mesc = a.created_at.month
      diac = a.created_at.day
      nomar = titulo.gsub(/[^0-9A-Za-z.\-]/, '_')  + "-" + id.to_s
      rutaf = "#{anioc.to_i.to_s}/#{mesc.to_i.to_s}/#{diac.to_i.to_s}/" 
      rutajpg = rutacolchon.join(rutaf, nomar + '.jpg')
      urljpg = Pathname.new(urlcolchon.to_s).join(rutaf, nomar + '.jpg')
      rutapdf = rutacolchon.join(rutaf, nomar + '.pdf')
      urlpdf = Pathname.new(urlcolchon.to_s).join(rutaf, nomar + '.pdf')

      return [titulo, texto, rlocal,
              rutajpg, urljpg, 
              rutapdf, urlpdf]
    end

    def url_descarga_jpg(id)
      titulo, texto, rlocal, rutajpg, urljpg, rutapdf, urlpdf =
        datos_articulo(id) 
      return urljpg
    end


    # Prepara JPG y PDF para visualizar articulo con la identificación dada
    # y retornar información del mismo
    def prepara_imagenes(id)
      titulo, texto, rlocal, rutajpg, urljpg, rutapdf, urlpdf = 
        datos_articulo(id)
      # Genera JPG
      if !File.exists? "#{rutajpg.to_s}"
        FileUtils.mkdir_p rutajpg.dirname
        system('convert', '-append', rlocal.to_s, rutajpg.to_s)
      end
      if !File.exists? "#{rutajpg.to_s}"
        flash[:error] = "No fue posible convertir #{rlocal}"
        render inline: "No fue posible convertir #{rlocal}"
        return
      end
      # Genera PDF
      if !File.exists? "#{rutapdf.to_s}"
        FileUtils.mkdir_p rutapdf.dirname
        Prawn::Document.generate("#{rutapdf.to_s}") do
          font_families.update("Tuffy" => {
            :normal => Sip::Engine.root.join('app', 'assets', 'fonts', 'tuffy', 'Tuffy.ttf'),
            :italic => Sip::Engine.root.join('app', 'assets', 'fonts', 'tuffy', 'Tuffy_Italic.ttf'),
            :bold => Sip::Engine.root.join('app', 'assets', 'fonts', 'tuffy', 'Tuffy_Bold.ttf'),
            :bold_italic => Sip::Engine.root.join('app', 'assets', 'fonts', 'tuffy', 'Tuffy_Bold_Italic.ttf')
          })
          font "Tuffy"
          font_size 12
          text titulo
          w = 550
          h = 700
          bounding_box([0, cursor], :width => w, :height => h) do
            image "#{rutajpg.to_s}", :fit => [w, h]
            stroke_bounds
          end
        end
      end

      return [titulo, id, texto, urljpg.to_s, urlpdf.to_s, rlocal]
    end

  end
end
