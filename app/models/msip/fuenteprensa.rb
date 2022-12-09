require 'sal7711_gen/concerns/models/fuenteprensa'

module Msip
  class Fuenteprensa < ActiveRecord::Base
    include Sal7711Gen::Concerns::Models::Fuenteprensa
  end
end
