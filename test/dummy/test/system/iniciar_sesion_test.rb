require "application_system_test_case"

class IniciarSesionTest < ApplicationSystemTestCase

  test "iniciar sesión" do
    skip
    Msip::CapybaraHelper.iniciar_sesion(
      self, Rails.configuration.relative_url_root, 'sal7711', 'sal7711')
    
  end

end
