# encoding: UTF-8
require_relative '../../test_helper'

module Sal7711Gen
  class CategoriaprensaTest < ActiveSupport::TestCase

    PRUEBA_CATEGORIAPRENSA= {
      codigo: 'y',
      nombre: "Categoriaprensa",
      fechacreacion: "2015-05-11",
      created_at: "2015-05-11"
    }


    test "valido" do
      categoriaprensa = Categoriaprensa.create PRUEBA_CATEGORIAPRENSA
      assert categoriaprensa.valid?
      categoriaprensa.destroy
    end

    test "no valido" do
      categoriaprensa = Categoriaprensa.new PRUEBA_CATEGORIAPRENSA
      categoriaprensa.nombre = ''
      assert_not categoriaprensa.valid?
      categoriaprensa.destroy
    end

    test "existente" do
      categoriaprensa = Sal7711Gen::Categoriaprensa.where(id: 3).take
      assert_equal categoriaprensa.codigo, "A11"
    end

  end
end
