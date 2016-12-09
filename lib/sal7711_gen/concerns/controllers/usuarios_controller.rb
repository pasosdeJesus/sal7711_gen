# encoding: UTF-8

require 'bcrypt'

module Sal7711Gen
  module Concerns
    module Controllers
      module BitacoraController

        extend ActiveSupport::Concern

        included do

          def destroy
            id = params[:id].to_i
            if Sal7711Gen::Bitacora.where(usuario_id: id).count > 0
              flash[:error] = "No puede eliminar un usuario con " +
                "entradas en la bitácora. " +
                " Puede deshabilitarlo poniendo una fecha de deshabilitación."
              redirect_to usuarios_path
            else  
              super
            end
          end


        end # included do

      end
    end
  end
end
