# encoding: UTF-8

require_relative '../../test_helper'

module Sal7711Gen
  class BitacoraTest < ActiveSupport::TestCase

    PRUEBA_BITACORA= {
      fecha: '2017-03-14',
      ip: '1.1.1.1',
      usuario_id: 1,
      operacion: 'o1',
      detalle: 'd1',
      detalle2: 'd2',
      detalle3: 'd3',
    }

    test "valido" do
      bitacora = Bitacora.create PRUEBA_BITACORA
      assert bitacora.valid?
      bitacora.destroy
    end


  end
end
