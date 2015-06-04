module Sal7711Gen
  class ArticulosController < ApplicationController
    before_action :set_articulo, only: [:show, :edit, :update, :destroy]

    # GET /articulos
    # GET /articulos.json
    def index
      @articulos = Sal7711Gen::Articulo.all
    end

    # GET /articulos/1
    # GET /articulos/1.json
    def show
    end

    # GET /articulos/new
    def new
      @articulo = Sal7711Gen::Articulo.new
    end

    # GET /articulos/1/edit
    def edit
    end

    # POST /articulos
    # POST /articulos.json
    def create
      @articulo = Sal7711Gen::Articulo.new(articulo_params)

      respond_to do |format|
        if @articulo.save
          format.html { redirect_to '/articulos', notice: 'Sal7711 gen articulo was successfully created.' }
          format.json { render :show, status: :created, location: @articulo }
        else
          format.html { render :new }
          format.json { render json: @articulo.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /articulos/1
    # PATCH/PUT /articulos/1.json
    def update
      respond_to do |format|
        if @articulo.update(articulo_params)
          format.html { redirect_to @articulo, notice: 'Sal7711 gen articulo was successfully updated.' }
          format.json { render :show, status: :ok, location: @articulo }
        else
          format.html { render :edit }
          format.json { render json: @articulo.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /articulos/1
    # DELETE /articulos/1.json
    def destroy
      @articulo.destroy
      respond_to do |format|
        format.html { redirect_to articulos_url, notice: 'Sal7711 gen articulo was successfully destroyed.' }
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
      params.require(:articulo).permit(:departamento_id, :municipio_id, :fuenteprensa_id, :fecha, :pagina, :created_at, :updated_at)
    end
  end
end
