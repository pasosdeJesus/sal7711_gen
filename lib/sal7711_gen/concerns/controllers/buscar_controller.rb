# encoding: UTF-8
module Sal7711Gen
  module Concerns
    module Controllers
      module BuscarController

        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper
  
          # entradas por página
          @@porpag = 20 


          # Prepara una página de resultados
          def prepara_pagina
            @articulos = Articulo.all
            if (params[:fechaini] && params[:fechaini] != '')
              pfi = params[:fechaini]
              if Rails.application.config.formato_fecha == 'dd-mm-yyyy'
                pfid = Date.strptime(pfi, '%d-%m-%Y')
              else
                pfid = Date.strptime(pfi, '%Y-%m-%d')
              end
              @articulos = @articulos.where("fecha >= ?", pfid.strftime('%Y-%m-%d'))
            end
            if(params[:fechafin] && params[:fechafin] != '')
              pff = params[:fechafin]
              if Rails.application.config.formato_fecha == 'dd-mm-yyyy'
                pffd = Date.strptime(pff, '%d-%m-%Y')
              else
                pffd = Date.strptime(pff, '%Y-%m-%d')
              end
              @articulos = @articulos.where("fecha <= ?", pffd.strftime('%Y-%m-%d'))
            end
            if (params[:mundep] && params[:mundep] != '')
              pmd = params[:mundep].split(" / ")
              if pmd.length == 1 # solo departamento
                dep = Sip::Departamento.all.where('nombre=?', pmd[0]).take
                if dep
                  @articulos = @articulos.where("departamento_id = ?", dep.id)
                else
                  @articulos = @articulos.where("departamento_id = '-1'")
                end
              else # departamento y municipio
                dep = Sip::Departamento.all.where('nombre=?', pmd[1]).take
                if dep
                  mun = Sip::Municipio.all.where(
                    'nombre=? AND id_departamento=?', pmd[0], dep.id).take
                  if mun
                    @articulos = @articulos.where("municipio_id = ?", mun.id)
                  else
                    @articulos = @articulos.where("municipio_id = '-1'")
                  end
                end
              end
            end
        
            if(params[:fuente] && params[:fuente][:nombre] &&
               params[:fuente][:nombre]  != '')
              fu = Sip::Fuenteprensa.all.where(
                'nombre=?', params[:fuente][:nombre]).take
              if fu
                @articulos = @articulos.where("fuenteprensa_id = ?", fu.id)
              else
                @articulos = @articulos.where("fuenteprensa_id = '-1'")
              end
            end
            if(params[:pagina] && params[:pagina] != '')
              @articulos = @articulos.where("pagina = ?", params[:pagina])
            end
            if(params[:categoria] && params[:categoria] != '')
              ccat = params[:categoria].upcase.split(' ')[0]
              cat = Sal7711Gen::Categoriaprensa.where('codigo=?', ccat).take;
              if cat
                @articulos = @articulos.joins(:articulo_categoriaprensa).where(
                  "categoriaprensa_id=?", cat)
              end
            end
            @numregistros = @articulos.count
            @articulos = @articulos.order("fecha").select(
              "id AS id, fecha AS titulo")
            @coltexto = "titulo"
            @colid = "id"
            pag = 1
            if (params[:pag])
              pag = params[:pag].to_i
            end
            @entradas = WillPaginate::Collection.create(
              pag, @@porpag, @numregistros
            ) do |paginador|
        
              c = @articulos.to_sql 
              c += " LIMIT #{paginador.per_page} OFFSET #{paginador.offset}"
              puts "OJO c=#{c}"
              result = ActiveRecord::Base.connection.execute(c)
              puts result
              arr = []
              result.try(:each) do |fila|
                byebug
                puts fila[@coltexto]
                arr.push(fila)
              end
              paginador.replace(arr)
              unless paginador.total_entries
                paginador.total_entries = @numresultados
              end
            end
          end
        
          # Resultado de aplicar filtro
          def index
            if !current_usuario
              authorize! :buscar, :index
            end
            #byebug
            if !@meses
              mes = Date.today.strftime("%m").to_i
              anio = Date.today.strftime("%Y").to_i
              @meses = []
              (0..23).each do |n|
                if Rails.application.config.formato_fecha == 'dd-mm-yyyy'
                  estem = mes.to_s.rjust(2, "0") + "-" + anio.to_s
                else
                  estem = anio.to_s + "-" + mes.to_s.rjust(2, "0")
                end
                @meses += [
                  [I18n.t("date.month_names")[mes] + " " + anio.to_s, estem]
                ]
                mes-=1
                if mes == 0 
                  mes = 12
                  anio-=1
                end
              end
            end
            prepara_pagina 
            if params.count > 2
              # 2 params que siempre estan son controller y action si hay
              # más sería una consulta iniciada por usuario
              Sal7711Gen::Bitacora.a( request.remote_ip, current_usuario, 
                                     'index', params)
            end
            respond_to do |format|
              format.html { }
              format.json { head :no_content }
              format.js   { render 'resultados' }
            end
        
          end
        
          # Para responder a solicitudes AJAX de autocompletación de
          # municipio / departamento
          def mundep
              if !params[:term]
                respond_to do |format|
                  format.html { render inline: 'Falta variable term' }
                  format.json { render inline: 'Falta variable term' }
                end
              else
                term = Sip::Municipio.connection.quote_string(params[:term])
                consNom = term.downcase.strip #sin_tildes
                consNom.gsub!(/ +/, ":* & ")
                if consNom.length > 0
                  consNom += ":*"
                end
                where = " mundep  @@ to_tsquery('spanish', '#{consNom}')";
                # autocomplete de jquery requiere label, val
                qstring = "SELECT nombre as label, idlocal as value
                FROM sip_mundep 
                WHERE #{where} ORDER BY 1;"
        
                r = ActiveRecord::Base.connection.select_all qstring
                respond_to do |format|
                  format.json { render :json, inline: r.to_json }
                end
              end
          end
      
          def descarga(id, rutacache) 
            a = Articulo.joins(:anexo).where(
              "sal7711_gen_articulo.id = ?", id).take
            ruta = a.anexo.adjunto_file_name
            n = sprintf(Sip.ruta_anexos + "/%d_%s", a.anexo.id.to_i, 
                        File.basename(ruta))
            if Rails.application.config.formato_fecha == 'dd-mm-yyyy'
              titulo = a.fecha.strftime('%d-%m-%Y')
            else
              titulo = a.fecha.to_s
            end
#            dirl = Rails.root.join('public').to_s
#            rutadescarga = "/assets/images/cache-articulos/" + 
#              File.basename(ruta.gsub("\\", "/"))
#            rlocal = dirl + image_path(rutadescarga)
#            puts "OJO rlocal=#{rlocal}"
#            if !File.exists? rlocal
#              FileUtils.mkdir_p(dirl + "/assets/images/cache-articulos/")
#              FileUtils.cp(n, rlocal)
#            end
            return [titulo, n]
          end

          def mostraruno
            if (params[:id] && params[:id].to_i > 0)
              #byebug
              id = params[:id].to_i
              rutapublic = Rails.root.join('public').to_s
              urlcache = '/assets/images/cache-articulos/'
              rutacache = rutapublic + urlcache
              if (!File.exists? rutacache)
                raise "Crear directorio #{rutacache}"
              end
              titulo, rlocal = descarga(id, rutacache)
              @titulo = titulo
              # Convierte a jpg
              nomar = titulo.gsub(/[^0-9A-Za-z.\-]/, '_')  + "-" + id.to_s
              @descargajpg = urlcache + nomar + ".jpg"
              rutajpg = rutacache + nomar + ".jpg"
              #img = Magick::Image.read(rlocal).first
              #img.write ""
              # Image.read falla para algunas imagenes con  Null count for "Tag 34026" (type 1, writecount │-3, passcount 1). `_TIFFVSetField' @ error/tiff.c/TIFFErrors/508):
              if !File.exists? "#{rutajpg}"
                system("convert #{rlocal} #{rutajpg}")
              end
              if !File.exists? "#{rutajpg}"
                return
              end
              # Genera PDF
              @descargapdf= urlcache + nomar + ".pdf"
              rutapdf = rutacache + nomar + ".pdf"
              puts "rutapdf=#{rutapdf}"
              if !File.exists? "#{rutapdf}"
                Prawn::Document.generate("#{rutapdf}") do
                  w = 550
                  h = 700
                  text titulo
                  bounding_box([0, cursor], :width => w, :height => h) do
                    image "#{rutajpg}", :fit => [w, h]
                    stroke_bounds
                  end
                end
              end
              Sal7711Gen::Bitacora.a( request.remote_ip, current_usuario, 
                         'mostraruno', rlocal)
              respond_to do |format|
                format.html { render 'sal7711_gen/articulos/show', layout: nil}
                format.json { head :no_content }
                format.js   { render action: :mostraruno }
              end
            end
          end
        end

      end
    end
  end
end
