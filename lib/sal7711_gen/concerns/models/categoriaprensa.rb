# encoding: UTF-8

module Sal7711Gen
  module Concerns
    module Models
      module Categoriaprensa
        extend ActiveSupport::Concern
        include Sip::Basica

        included do

          validates :codigo, presence: true, allow_blank: false, 
            uniqueness: { case_senstivie: false }

          def codigo=(val)
            self[:codigo] = val.upcase.squish
          end

          def presenta_nombre
            self.codigo + ' ' + self.nombre
          end          

          # Para búsquedas tipo autocompletacion en base de datos campos a observar
          def self.busca_etiqueta_campos
            ['codigo', 'nombre']
          end
        end
      end
    end
  end
end

