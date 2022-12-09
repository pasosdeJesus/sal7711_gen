module Sal7711Gen
  module Admin
    class CategoriasprensaController < Msip::Admin::BasicasController
      before_action :set_categoriaprensa, 
        only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource  class: Sal7711Gen::Categoriaprensa

      def clase 
        "Sal7711Gen::Categoriaprensa"
      end

      def camponombre
        :codigo
      end

      def set_categoriaprensa
        @basica = Categoriaprensa.find(params[:id])
      end

      def atributos_index
        [
          "id", 
          "codigo", 
          "nombre", 
          "observaciones", 
          "fechacreacion_localizada", 
          "habilitado"
        ]
      end

      def categoriaprensa_params
        params.require(:categoriaprensa).permit(*atributos_form)
      end

    end
  end
end
