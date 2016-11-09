# encoding: UTF-8

module Sal7711Gen
  module Concerns
    module Controllers
      module ArticulosController

        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper
          include Sip::FormatoFechaHelper
          include Sal7711Gen::ApplicationHelper
  
          before_action :set_articulo, only: [:edit, :update, :destroy]

          # GET /articulos/new
          def new
            authorize! :edit, Sal7711Gen::Articulo
            @articulo = Sal7711Gen::Articulo.new
            @articulo.adjunto_descripcion = "J"
            #logger.debug "Anexo salvado: #{@articulo.anexo.inspect}"
          end

          def self.gen_descripcion_categoria_bd articulo
            return articulo.articulo_categoriaprensa.to_a.map {|i| 
              i.categoriaprensa_id 
            }.uniq.inject("") { 
              |memo, i| 
              c = Sal7711Gen::Categoriaprensa.find(i).codigo
              memo == "" ? c : memo + ", " + c 
            }
          end

          def self.gen_descripcion_pagina_bd(articulo)
            if articulo.pagina
              return " | " + articulo.pagina
            end
            return ""
          end

          def self.gen_descripcion_bd(articulo)
            ndep = ''
            if articulo.departamento_id
              dep = Sip::Departamento.find(articulo.departamento_id)
              ndep = articulo.departamento.nombre
            end
            nmun = ''
            if articulo.municipio_id
              nmun= articulo.municipio.nombre
            end
            nfuente = ''
            if articulo.fuenteprensa_id
              nfuente = articulo.fuenteprensa.nombre
            end
            ncat = gen_descripcion_categoria_bd articulo
            npag = gen_descripcion_pagina_bd articulo
            ap = articulo.fecha ?  
              Sip::FormatoFechaHelper::fecha_estandar_local(articulo.fecha.to_s) : ''
            return ap + " | " + ncat + " | " +
              nmun + " / " + ndep + " | " + nfuente + npag
          end


          # Completa @articulo ya guardado. Debe terminar guardando.
          def ordena_articulo
            @articulo.adjunto_descripcion = Sal7711Gen::ArticulosController.gen_descripcion_bd(@articulo)
            @articulo.save
          end


          def create_gen(articulo)
            respond_to do |format|
              if articulo.save
                ordena_articulo
                format.html { 
                  redirect_to articulos_url, notice: 'Artículo creado.' 
                }
                format.json { render :show, status: :created, location: articulo }
              else
                format.html { render :new }
                format.json { render json: articulo.errors, status: :unprocessable_entity }
              end
            end
          end

          # POST /articulos
          # POST /articulos.json
          def create
            authorize! :edit, Sal7711Gen::Articulo
            @articulo = Sal7711Gen::Articulo.new(articulo_params)
            @articulo.adjunto_descripcion = 'J'
            create_gen(@articulo)
          end

          # GET /articulos/1/edit
          def edit
            authorize! :edit, Sal7711Gen::Articulo
            prepara_imagenes(@articulo.id)
          end

          # PATCH/PUT /articulos/1
          # PATCH/PUT /articulos/1.json
          def update
            authorize! :edit, Sal7711Gen::Articulo
            respond_to do |format|
              if @articulo.update(articulo_params)
                ordena_articulo
                format.html { 
                  redirect_to @articulo, notice: 'Artículo actualizado.' 
                }
                format.json { render :show, status: :ok, location: @articulo }
              else
                format.html { render :edit }
                format.json { 
                  render json: @articulo.errors, status: :unprocessable_entity 
                }
              end
            end
          end

          # DELETE /articulos/1
          # DELETE /articulos/1.json
          def destroy
            authorize! :edit, Sal7711Gen::Articulo
            @articulo.destroy
            respond_to do |format|
              format.html { 
                redirect_to articulos_url, notice: 'Artículo eliminado.' 
              }
              format.json { head :no_content }
            end
          end

          private
          # Use callbacks to share common setup or constraints between actions.
          def set_articulo
            @articulo = Articulo.find(params[:id])
          end

          # Never trust parameters from the scary internet, only allow the white list through.
          def articulo_params
            params.require(:articulo).permit(
              :departamento_id, 
              :municipio_id, 
              :fuenteprensa_id, 
              :fecha_localizada, 
              :pagina,
              :texto,
              :adjunto_descripcion,
              :adjunto,
              :archivo,
              {:categoriaprensa_ids => []}
            )
          end
        end

      end
    end
  end
end
