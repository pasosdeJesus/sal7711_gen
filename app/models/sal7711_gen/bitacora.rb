module Sal7711Gen
  class Bitacora < ActiveRecord::Base

    include Sip::Localizacion

    serialize :detalle
    belongs_to :usuario, foreign_key: 'usuario_id',
      validate: true, class_name: 'Usuario', optional: false

    campofecha_localizado :fecha

    def self.a(ip, usuario, operacion, detalle, detalle2 = nil, 
               detalle3 = nil)
      operacion = operacion ? operacion.to_s : ''
      operacion = operacion[0..49] if operacion && operacion.length > 50
      detalle2 = detalle2 ? detalle2.to_s : ''
      detalle2 = detalle2[0..499] if detalle2 && detalle2.length > 500
      detalle3 = detalle3 ? detalle3.to_s : ''
      detalle3 = detalle3[0..499] if detalle3 && detalle3.length > 500
      b = Bitacora.new(fecha: Time.now.utc.iso8601,
                       ip: ip.to_s,
                   usuario_id: usuario.id,
                   operacion: operacion.to_s,
                   detalle: detalle.to_s,
                   detalle2: detalle2,
                   detalle3: detalle3)
      if b.detalle && b.detalle.to_yaml.length > 5000
       b.detalle = b.detalle.to_yaml[0..4000]
      end
      b.save!
    end
  end
end
