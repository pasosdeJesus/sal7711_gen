require 'msip/concerns/models/usuario'

module Sal7711Gen
  module Concerns
    module Models
      module Usuario
        extend ActiveSupport::Concern

        included do
          include Msip::Concerns::Models::Usuario

          has_many :bitacoras, foreign_key: 'usuario_id',
            dependent: :destroy, class_name: 'Sal7711Gen::Bitacora'

        end
      end
    end
  end
end

