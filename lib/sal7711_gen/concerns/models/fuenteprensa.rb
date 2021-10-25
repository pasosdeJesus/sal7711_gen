require 'sip/concerns/models/fuenteprensa'

module Sal7711Gen
  module Concerns
    module Models
      module Fuenteprensa
        extend ActiveSupport::Concern
        include Sip::Concerns::Models::Fuenteprensa

        included do

          has_many :articulo, 
            class_name: 'Sal7711Gen::Articulo',
            foreign_key: 'fuenteprensa_id'

        end
      end
    end
  end
end

