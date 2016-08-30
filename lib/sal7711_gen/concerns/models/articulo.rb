# encoding: UTF-8

module Sal7711Gen
  module Concerns
    module Models
      module Articulo
        extend ActiveSupport::Concern

        include Sip::Localizacion

        included do

          belongs_to :departamento, foreign_key: "departamento_id",
            validate: true, class_name: "Sip::Departamento"
          belongs_to :municipio, foreign_key: "municipio_id",
            validate: true, class_name: "Sip::Municipio"
          belongs_to :fuenteprensa, foreign_key: "fuenteprensa_id",
            validate: true, class_name: "Sip::Fuenteprensa", required: true

          campofecha_localizado :fecha

          has_attached_file :adjunto, :path => :ruta_articulo

          def ruta_articulo
            File.join(Sip.ruta_anexos, fecha.year.to_s,
            fecha.month.to_s.rjust(2, '0'),
            fecha.day.to_s.rjust(2, '0'),
            "/#{id}_#{adjunto_file_name}")
          end

          validates_attachment_content_type :adjunto, 
            :content_type => ['text/plain', /.*/]
          validates_attachment_presence :adjunto
          validates :adjunto_file_name, length: { maximum: 255 }
          validates :adjunto_content_type, length: { maximum: 255 }
          validates :adjunto_descripcion, presence: true, allow_blank: false, 
              length: { maximum: 1500 } 

          has_many :articulo_categoriaprensa, 
            class_name: 'Sal7711Gen::ArticuloCategoriaprensa',
            dependent: :delete_all, foreign_key: 'articulo_id'
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

        end # included

      end
    end
  end
end
