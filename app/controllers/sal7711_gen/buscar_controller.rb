require 'sal7711_gen/concerns/controllers/buscar_controller'

module Sal7711Gen
  class BuscarController < ApplicationController

    # Autorizacion se hace en detalle por posibilidad de autorizacion por IP
    include Sal7711Gen::Concerns::Controllers::BuscarController    

  end
end
