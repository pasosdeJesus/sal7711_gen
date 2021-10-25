require_relative '../../test_helper'

module Sal7711Gen
  class ArticulosControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers
    include Devise::Test::IntegrationHelpers

    setup do
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
    end

    def verifica_formulario
      assert_select "input#articulo_fecha_localizada[name=?]", "articulo[fecha_localizada]"
      assert_select "select#articulo_departamento_id[name=?]", "articulo[departamento_id]"
    end

    test "new" do
      skip
      get new_articulo_url
      assert_response :success
      #puts @response.body
      assert_select 'form' do
        verifica_formulario
      end
    end

  end
end
