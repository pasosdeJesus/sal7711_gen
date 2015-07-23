# encoding: UTF-8
#
module Sal7711Gen
  class Bitacora < ActiveRecord::Base

    serialize :detalle

    def self.a(ip, usuario, operacion, detalle)
      b = Bitacora.new(fecha: Time.now.utc.iso8601,
                   ip: ip,
                   usuario_id: usuario.id,
                   operacion: operacion,
                   detalle: detalle)
      b.save!
    end
  end
end