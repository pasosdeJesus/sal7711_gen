# encoding: UTF-8

require 'sal7711_gen/concerns/models/fuenteprensa'

module Sip
  class Fuenteprensa < ActiveRecord::Base
    include Sal7711Gen::Concerns::Models::Fuenteprensa
  end
end
