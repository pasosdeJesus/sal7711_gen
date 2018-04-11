# encoding: UTF-8
#
module Sal7711Gen
  class Bitacora < ActiveRecord::Base

    include Sip::Localizacion

    serialize :detalle
    belongs_to :usuario, foreign_key: 'usuario_id',
      validate: true, class_name: 'Usuario'

    campofecha_localizado :fecha

    def self.a(ip, usuario, operacion, detalle, detalle2 = nil, 
               detalle3 = nil)
      operacion = operacion[0..49] if operacion.length > 50
      detalle = detalle[0..4999] if detalle.length > 5000
      detalle2 = detalle2[0..499] if detalle2.length > 500
      detalle3 = detalle3[0..499] if detalle3.length > 500
      b = Bitacora.new(fecha: Time.now.utc.iso8601,
                   ip: ip,
                   usuario_id: usuario.id,
                   operacion: operacion,
                   detalle: detalle,
                   detalle2: detalle2,
                   detalle3: detalle3)
      b.save!
    end
  end
end
