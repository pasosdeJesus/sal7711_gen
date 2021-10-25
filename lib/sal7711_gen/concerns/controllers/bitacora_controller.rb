module Sal7711Gen
  module Concerns
    module Controllers
      module BitacoraController

        extend ActiveSupport::Concern

        included do
          helper ::Sal7711Gen::ApplicationHelper

          # historia por mostrar
          @@porpag = 20 

          # Prepara una página de resultados
          def usuario
            if !current_usuario
              authorize! :buscar, :index
            end
            @consultas = Bitacora.all.where(
              usuario_id: current_usuario.id,
              operacion: 'index').order('fecha desc').limit(@@porpag)
            respond_to do |format|
              format.html { render partial: 'consultausuario' }
              format.json { head :no_content }
              format.js   { render partial: 'consultausuario' }
            end
          end

        end

      end
    end
  end
end

