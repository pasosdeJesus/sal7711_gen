module Sal7711Gen
  module Concerns
    module Models
      module Categoriaprensa
        extend ActiveSupport::Concern
        include Msip::Basica

        included do

          has_and_belongs_to_many :articulo, 
            class_name: "Sal7711Gen::Articulo",
            foreign_key: "categoriaprensa_id", 
            association_foreign_key: "articulo_id",
            join_table: "sal7711_gen_articulo_categoriaprensa"

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

