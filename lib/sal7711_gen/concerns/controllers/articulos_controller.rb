# encoding: UTF-8

module Sal7711Gen
  module Concerns
    module Controllers
      module ArticulosController

        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper
  
          before_action :set_articulo, only: [:edit, :update, :destroy]

          # GET /articulos/new
          def new
            @articulo = Sal7711Gen::Articulo.new
            @articulo.adjunto_descripcion = "J"
            #logger.debug "Anexo salvado: #{@articulo.anexo.inspect}"
          end

          def gen_descripcion(articulos_params)
            ndep = '';
            if articulo_params['departamento_id'] && 
              articulo_params['departamento_id'] != ''
              dep = Sip::Departamento.find(articulo_params['departamento_id'])
              ndep = dep.nombre;
            end
            nmun = '';
            if articulo_params['municipio_id'] && 
              articulo_params['municipio_id'] != ''
              mun= Sip::Municipio.find(articulo_params['municipio_id'])
              nmun= mun.nombre;
            end
            nfuente = '';
            if articulo_params['fuenteprensa_id'] && 
              articulo_params['fuenteprensa_id'] != ''
              fu = Sip::Fuenteprensa.find(articulo_params['fuenteprensa_id'])
              nfuente = fu.nombre;
            end
            ncat = '';
            if articulo_params['categoriaprensa_ids'] && 
              articulo_params['categoriaprensa_ids'].count > 0
              articulo_params['categoriaprensa_ids'].sort.each { |i|
                if i != ''
                  cat = Sal7711Gen::Categoriaprensa.find(i)
                  ncat += (ncat == "" ? "" : ", ") + cat.codigo
                end
              }
            end
            npag = '';
            if articulo_params['pagina'] && articulo_params['pagina'] != ''
              npag = articulo_params['pagina']
            end
            byebug
            return articulo_params['fecha_localizada'] + 
              " | " + ncat + " | " +
              nmun + " / " + ndep + " | " + nfuente + " | " + npag
              
          end

          # POST /articulos
          # POST /articulos.json
          def create_gen(articulo)

            respond_to do |format|
              if articulo.save
                format.html { redirect_to '/articulos', notice: 'Artículo creado.' }
                format.json { render :show, status: :created, location: articulo }
              else
                format.html { render :new }
                format.json { render json: articulo.errors, status: :unprocessable_entity }
              end
            end
          end

          def create
            @articulo = Sal7711Gen::Articulo.new(articulo_params)
            @articulo.adjunto_descripcion = gen_descripcion(articulo_params)
            create_gen(@articulo)
          end

          # GET /articulos/1/edit
          def edit
          end

          # PATCH/PUT /articulos/1
          # PATCH/PUT /articulos/1.json
          def update
            @articulo.adjunto_descripcion = gen_descripcion(articulo_params)
            respond_to do |format|
              if @articulo.update(articulo_params)
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
