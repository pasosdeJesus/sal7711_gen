require_relative '../../test_helper'

module Sal7711Gen
  class ArticuloTest < ActiveSupport::TestCase

    PRUEBA_ARTICULO= {
      fecha:       "2015-06-03",
      pagina:      "1A",
      fuenteprensa_id: 1,
      departamento_id: 1,
      adjunto_descripcion: 'x',
      adjunto: File.new('test/fixtures/ej.png'),
      created_at:  "2015-06-03"
    }

    test "valido" do
      articulo = Articulo.create PRUEBA_ARTICULO
      assert articulo.valid?
      articulo.destroy
    end

    test "no valido" do
      articulo = Articulo.new PRUEBA_ARTICULO
      articulo.fecha = nil
      assert_not articulo.valid?
      articulo.destroy
    end

  end
end
