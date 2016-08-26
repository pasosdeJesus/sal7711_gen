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

    def ruta_descarga(id, ext)
      Rails.configuration.x.ruta_colchon + "buscar/#{id.to_s}"
    end

    # Retorna datos del articulo con la id dada en un vector con:
    # 0- titulo
    # 1- texto
    # 1- rlocal Ruta a fuente (e.g TIF) en sistema de archivos
    # 2- rutajpg Pathname al jpg en colchón en sistema de archivos
    # 3- urljpg Pathname con url relativo al jpg de colchón
    # 4- rutapdf Pathname al pdf en colchón en sistema de archivos
    # 5- urlpdf Pathname con url relativo al pdf en colchón
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
      anio = a.fecha.year
      mes = a.fecha.month
      dia = a.fecha.day
      nomar = titulo.gsub(/[^0-9A-Za-z.\-]/, '_')  + "-" + id.to_s
      rutaf = "#{anio.to_i.to_s}/#{mes.to_i.to_s}/#{dia.to_i.to_s}/" 
      rutajpg = rutacolchon.join(rutaf, nomar + '.jpg')
      urljpg = Pathname.new(urlcolchon.to_s).join(rutaf, nomar + '.jpg')
      rutapdf = rutacolchon.join(rutaf, nomar + '.pdf')
      urlpdf = Pathname.new(urlcolchon.to_s).join(rutaf, nomar + '.pdf')

      return [titulo, texto, rlocal,
              rutajpg, urljpg, 
              rutapdf, urlpdf]
    end

  end
end
