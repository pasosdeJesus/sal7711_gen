# encoding: UTF-8

require 'sal7711_gen/concerns/controllers/usuarios_controller'

module Sal7711Gen
  class UsuariosController < Sip::UsuariosController
 
    include Sal7711Gen::Concerns::Controllers::UsuariosController    
  
  end
end
