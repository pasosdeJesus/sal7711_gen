# encoding: UTF-8

require 'sal7711_gen/concerns/models/usuario'

class Usuario < ActiveRecord::Base
  include Sal7711Gen::Concerns::Models::Usuario
end
