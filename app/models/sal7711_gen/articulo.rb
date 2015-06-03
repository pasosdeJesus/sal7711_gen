# encoding: UTF-8
module Sal7711Gen
  class Articulo < ActiveRecord::Base

    belongs_to :departamento, foreign_key: "departamento_id",
      validate: true, class_name: "Sip::Departamento"
    belongs_to :municipio, foreign_key: "municipio_id",
      validate: true, class_name: "Sip::Municipio"
    belongs_to :fuenteprensa, foreign_key: "fuenteprensa_id",
      validate: true, class_name: "Sip::Fuenteprensa", required: true
    has_many :articulo_categoriaprensa, 
      class_name: 'Sal7711Gen::ArticuloCategoriaprensa',
      dependent: :delete_all,
      foreign_key: 'articulo_id'
    has_many :categoriaprensa, class_name: 'Sal7711Gen::Categoriaprensa',
      through: :articulo_categoriaprensa

    validates :fuenteprensa_id, presence: true
    validates :fecha, presence: true
    validates :pagina, presence: true, length: { maximum: 20 }

    validate :departamento_y_municipio_coinciden
    def departamento_y_municipio_coinciden
      if municipio 
        if !departamento 
          errors.add :departamento, "Municipio sin departamento"
        elsif municipio.id_departamento != departamento.id
          errors.add :municipio, "Municipio no corresponda a departamento"
        end
      end
    end

  end
end
