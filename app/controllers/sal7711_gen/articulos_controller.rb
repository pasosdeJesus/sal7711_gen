require 'sal7711_gen/concerns/controllers/articulos_controller'

module Sal7711Gen
  class ArticulosController < Msip::ModelosController
 
    before_action :set_articulo, only: [:edit, :update, :destroy]
    load_and_authorize_resource class: Sal7711Gen::Articulo
    include Sal7711Gen::Concerns::Controllers::ArticulosController    

  end
end
