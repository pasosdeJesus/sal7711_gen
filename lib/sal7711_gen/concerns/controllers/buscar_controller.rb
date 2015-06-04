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
              pfid = Date.strptime(pfi, '%d-%m-%Y')
              @articulos.where("fecha >= ?", pfid.strftime('%Y-%m-%d'))
            end
            if(params[:fechafin] && params[:fechafin] != '')
              pff = params[:fechafin]
              pffd = Date.strptime(pff, '%d-%m-%Y')
              @articulos.where("fecha <= ?", pffd.strftime('%Y-%m-%d'))
            end
            if (params[:mundep] && params[:mundep] != '')
              pmd = params[:mundep].split(" / ")
              if pmd.length == 1 # solo departamento
                @articulos.where("departamento_id = ?", pmd[0])
              else # departamento y municipio
                @articulos.where("municipio_id = ?", pmd[1])
              end
            end

            if(params[:fuente] && params[:fuente][:nombre] != '')
              @articulos.where("fuente_id = ?", params[:fuente])
            end
            if(params[:pagina] && params[:pagina] != '')
              @articulos.where("pagina = ?", params[:pagina])
            end
            if(params[:categoria_id] && params[:categoria_id] != '')
              cat = Sal7711Gen::Categoriaprensa.find(params[:categoria_id]);
              if cat.supracategoria
                @articulos.where("CAST(pagina = ?", params[:categoria_id])
                op = ' LIKE ';
                cod = "#{cat.codigo}%"
              else
                @articulos.from(:sal7711_gen_articulo_categoriaprensa).where("CAST(pagina = ?", params[:categoria_id])
              end
            end
            @articulos.order("fecha").select("id, fecha")
            cons = @articulos.to_sql
            @numregistros = @articulos.count
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
                puts fila["itemname"]
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
                @meses += [
                  [I18n.t("date.month_names")[mes] + " " + anio.to_s, 
                   mes.to_s.rjust(2, "0") + "-" + anio.to_s]
                ]
                mes-=1
                if mes == 0 
                  mes = 12
                  anio-=1
                end
              end
            end
            prepara_pagina 
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

          def mostraruno
            if (params[:id] && params[:id].to_i > 0)
              conecta
              id = params[:id]
              c="SELECT filepath, itemdata.itemname 
        FROM itemdata INNER JOIN itemdatapage 
          ON itemdata.itemnum=itemdatapage.itemnum 
        WHERE itemdata.itemnum='#{id}'";
              rutar = @client.execute(c)
              fila = rutar.first
              ruta = fila["filepath"].strip
              @titulo = titulo = fila["itemname"].strip
              smbc = Sambal::Client.new(@@parsmb)
              dirl = Rails.root.join('public').to_s
              FileUtils.mkdir_p(dirl + "/assets/images/cache-articulos/")
              @rutadescarga = "/assets/images/cache-articulos/" + 
                File.basename(ruta.gsub("\\", "/"))
              rlocal = dirl + image_path(@rutadescarga)
              puts "OJO rlocal=#{rlocal}"
              g = smbc.get(ruta, rlocal)
              smbc.close
              m = g.message.to_s.chomp
              puts "m=#{m}"
              is = m.index(" of size ")
              if (is <= 0)
                return
              end
              fs = m.index(" as #{dirl}")
              s=m[is+9..fs].to_i
              arr = []
              #byebug
              system("convert #{rlocal} #{rlocal}.jpg")
              if !File.exists?("#{rlocal}.jpg")
                return
              end
              # Genera PDF
              Prawn::Document.generate("#{rlocal}.pdf") do
                w = 550
                h = 700
                text titulo
                bounding_box([0, cursor], :width => w, :height => h) do
                  image "#{rlocal}.jpg", :fit => [w, h]
                  stroke_bounds
                end
              end

              format.html { head :no_content }
              format.json { head :no_content }
              format.js   { render action: :mostraruno }
            end
          end

        end

      end
    end
  end
end
