# encoding: UTF-8

require 'sip/concerns/controllers/usuarios_controller'

module Sal7711Gen
  module Concerns
    module Controllers
      module UsuariosController

        extend ActiveSupport::Concern

        included do
          include Sip::Concerns::Controllers::UsuariosController  

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
