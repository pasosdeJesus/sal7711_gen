# encoding: UTF-8

require 'fileutils'

module Sal7711Gen
  module Concerns
    module Controllers
      module BuscarController

        extend ActiveSupport::Concern

        include Sip::FormatoFechaHelper

        included do
          include ActionView::Helpers::AssetUrlHelper
          include Sal7711Gen::ApplicationHelper

          # entradas por página
          @@porpag = 20 

          def orden_articulos
            "fecha"
          end

          # Complemento para aplicar mas filtros
          def prepara_pagina_comp(articulos, params)
            return articulos
          end

          # Prepara una página de resultados
          def prepara_pagina
            @articulos = Articulo.all
            if (params[:buscar] && params[:buscar][:fechaini] && 
                params[:buscar][:fechaini] != '')
              pfi = params[:buscar][:fechaini]
              pfid = Date.strptime(fecha_local_estandar(pfi), '%Y-%m-%d')
              @articulos = @articulos.where("fecha >= ?", pfid.strftime('%Y-%m-%d'))
            end
            if(params[:buscar] && params[:buscar][:fechafin] && params[:buscar][:fechafin] != '')
              pff = params[:buscar][:fechafin]
              pffd = Date.strptime(fecha_local_estandar(pff), '%Y-%m-%d')
              @articulos = @articulos.where("fecha <= ?", 
                                            pffd.strftime('%Y-%m-%d'))
            end
            if (params[:buscar] && params[:buscar][:mundep] && params[:buscar][:mundep] != '')
              pmd = params[:buscar][:mundep].split(" / ")
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
        
            if(params[:buscar] && params[:buscar][:fuente] && 
               params[:buscar][:fuente]  != '')
              fu = Sip::Fuenteprensa.all.find(params[:buscar][:fuente])
              if fu
                @articulos = @articulos.where("fuenteprensa_id = ?", fu.id)
              else
                @articulos = @articulos.where("fuenteprensa_id = '-1'")
              end
            end
            if(params[:buscar] && params[:buscar][:pagina] && 
               params[:buscar][:pagina] != '')
              @articulos = @articulos.where("pagina = ?", params[:buscar][:pagina])
            end
            if(params[:buscar] && params[:buscar][:categoria] && 
               params[:buscar][:categoria] != '')
              ccat = params[:buscar][:categoria].upcase.split(' ')[0]
              cat = Sal7711Gen::Categoriaprensa.where('codigo=?', ccat).take;
              if cat
                @articulos = @articulos.joins(
                  :articulo_categoriaprensa).where(
                    "categoriaprensa_id=?", cat)
              end
            end

            @articulos = prepara_pagina_comp(@articulos, params)

            @numregistros = @articulos.count
            @articulos = @articulos.order(orden_articulos).select(
              "sal7711_gen_articulo.id AS id, " +
              "sal7711_gen_articulo.adjunto_descripcion AS titulo, " +
              "sal7711_gen_articulo.texto AS texto"
            )
            @coltexto = "titulo"
            @colid = "id"
            @coldesc = "texto"
            pag = 1
            if (params[:pag])
              pag = params[:pag].to_i
            end
            @entradas = WillPaginate::Collection.create(
              pag, @@porpag, @numregistros
            ) do |paginador|
              c = @articulos.to_sql 
              if (paginador.offset == 0) 
                desp = 0
                limite = paginador.per_page + 1
              else
                desp = paginador.offset - 1
                limite = paginador.per_page + 2
              end
              c += " LIMIT #{limite} OFFSET #{desp}"
              puts "OJO c=#{c}"
              result = ActiveRecord::Base.connection.execute(c)
              puts result
              arr = []
              num = 0;
              ultid = ''
              result.try(:each) do |fila|
                if arr.last
                    arr.last["siguiente"] = fila["id"]
                end
                if ((paginador.offset == 0 && num < paginador.per_page) || 
                    (paginador.offset > 0 && num > 0 && 
                     num <= paginador.per_page))
                  if ultid != ''
                    fila["anterior"] = ultid
                  end
                  arr.push(fila)
                  puts ": #{fila[@coltexto]}"
                else
                  puts fila[@coltexto]
                end
                ultid = fila["id"]
                num += 1
              end
              paginador.replace(arr)
              unless paginador.total_entries
                paginador.total_entries = @numresultados
              end
            end
          end
       
         def autentica_especial
         end

          # Resultado de aplicar filtro
          def index
            autentica_especial
            authorize! :read, Sal7711Gen::Articulo
            #byebug
            if !@meses
              mes = Date.today.strftime("%m").to_i
              anio = Date.today.strftime("%Y").to_i
              @meses = []
              (0..23).each do |n|
                case Rails.application.config.x.formato_fecha 
                when 'dd-mm-yyyy', 'dd/mm/yyyy'
                  estem = mes.to_s.rjust(2, "0") + "-" + anio.to_s
                else
                  estem = anio.to_s + "-" + mes.to_s.rjust(2, "0")
                end
                @meses += [
                  [I18n.t("date.month_names")[mes] + " " + 
                   anio.to_s, estem]
                ]
                mes-=1
                if mes == 0 
                  mes = 12
                  anio-=1
                end
              end
            end
            prepara_pagina 
            @muestraid = params[:muestraid].to_i
            if params.to_h.count > 2
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
        
          def redirigeindex
            redirect_to buscar_url
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
      
          def descarga(id, rutacolchon) 
            a = Articulo.where("sal7711_gen_articulo.id = ?", id).take
            ruta = a.ruta_articulo
            titulo = a.adjunto_descripcion
            texto = a.texto
            anio = a.fecha.year
            mes = a.fecha.month
            dia = a.fecha.day
            return [titulo, ruta, texto, anio, mes, dia]
          end

          def mostraruno
            if (params[:id] && params[:id].to_i > 0)
              id = params[:id].to_i
              titulo, texto, rlocal, rutajpg, urljpg, rutapdf, urlpdf = 
                datos_articulo(id)
              @titulo = titulo
              @id = id
              @texto = texto
              @descargajpg = urljpg.to_s
              if !File.exists? "#{rutajpg.to_s}"
                FileUtils.mkdir_p rutajpg.dirname
                system("convert -append #{rlocal} #{rutajpg.to_s}")
              end
              if !File.exists? "#{rutajpg.to_s}"
                flash[:error] = "No fue posible convertir #{rlocal}"
                render inline: "No fue posible convertir #{rlocal}"
                return
              end
              # Genera PDF
              @descargapdf= urlpdf.to_s
              if !File.exists? "#{rutapdf.to_s}"
                FileUtils.mkdir_p rutapdf.dirname
                Prawn::Document.generate("#{rutapdf.to_s}") do
                  w = 550
                  h = 700
                  text titulo
                  bounding_box([0, cursor], :width => w, :height => h) do
                    image "#{rutajpg.to_s}", :fit => [w, h]
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
