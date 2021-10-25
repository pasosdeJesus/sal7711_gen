require 'sal7711_gen/concerns/models/articulo'

module Sal7711Gen
  class Articulo < ActiveRecord::Base
    include Sal7711Gen::Concerns::Models::Articulo
  end
end
