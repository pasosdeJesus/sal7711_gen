# encoding: UTF-8
require 'bcrypt'

class UsuariosController < Sip::UsuariosController

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
end
