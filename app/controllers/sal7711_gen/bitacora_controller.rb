require 'sal7711_gen/concerns/controllers/bitacora_controller'

module Sal7711Gen
  class BitacoraController < ApplicationController
 
    load_and_authorize_resource class: Sal7711Gen::Bitacora
    include Sal7711Gen::Concerns::Controllers::BitacoraController    
  
  end
end
