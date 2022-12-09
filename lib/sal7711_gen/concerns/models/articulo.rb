module Sal7711Gen
  module Concerns
    module Models
      module Articulo
        extend ActiveSupport::Concern


        included do

          include Msip::Localizacion
          include Msip::Modelo

          belongs_to :departamento, foreign_key: "departamento_id",
            validate: true, class_name: "Msip::Departamento", optional: true
          belongs_to :municipio, foreign_key: "municipio_id",
            validate: true, class_name: "Msip::Municipio", optional: true
          belongs_to :fuenteprensa, foreign_key: "fuenteprensa_id",
            validate: true, class_name: "Msip::Fuenteprensa", optional: true

          campofecha_localizado :fecha

          has_attached_file :adjunto, :path => :ruta_articulo

          def ruta_articulo
            File.join(Msip.ruta_anexos, created_at.year.to_s,
            created_at.month.to_s.rjust(2, '0'),
            created_at.day.to_s.rjust(2, '0'),
            "/#{id}_#{adjunto_file_name}")
          end
          #validates_attachment_presence :adjunto, 
          #  if: Rails.application.config.x.sal7711_presencia_adjunto
          validates_attachment_content_type :adjunto, 
            :content_type => ['text/plain', /.*/]
          validates :adjunto_file_name, length: { maximum: 255 }
          validates :adjunto_content_type, length: { maximum: 255 }
          validates :adjunto_descripcion, 
            presence: Rails.application.config.x.sal7711_presencia_adjuntodesc, 
            allow_blank: Rails.application.config.x.sal7711_presencia_adjuntodesc,
            length: { maximum: 1500 } 

          # Sería mejor con has_and_belongs_to_man en sal7711_gen
          # pero se requiere con has_many through en sal7711_cinep
          # Falta experimentar si puede sobrecargarse un has_and_belongs_to
          # de sal7711_gen con dos has_many y through en sal7711_cinep
          # Mientras no se prueba no usar con config.load_defaults 5.2
          has_and_belongs_to_many :categoriaprensa,
            class_name: 'Sal7711Gen::Categoriaprensa',
            foreign_key: "articulo_id",
            association_foreign_key: "categoriaprensa_id",
            join_table: "sal7711_gen_articulo_categoriaprensa"

#          has_many :articulo_categoriaprensa, 
#            class_name: 'Sal7711Gen::ArticuloCategoriaprensa',
#            dependent: :delete_all, foreign_key: 'articulo_id'
#          has_many :categoriaprensa, 
#            class_name: 'Sal7711Gen::Categoriaprensa',
#            through: :articulo_categoriaprensa

          validates :fuenteprensa_id, 
            presence: Rails.application.config.x.sal7711_presencia_fuenteprensa
          validates :fecha, presence: Rails.application.config.x.sal7711_presencia_fecha
          validates :pagina, presence: Rails.application.config.x.sal7711_presencia_pagina, length: { maximum: 20 }

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
