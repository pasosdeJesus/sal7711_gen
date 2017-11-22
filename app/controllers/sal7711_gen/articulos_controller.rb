# encoding: UTF-8

require 'sal7711_gen/concerns/controllers/articulos_controller'

module Sal7711Gen
  class ArticulosController < Sip::ModelosController
 
    include Sal7711Gen::Concerns::Controllers::ArticulosController    

  end
end
