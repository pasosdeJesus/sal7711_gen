# encoding: UTF-8

require 'spec_helper'

describe "Usuarios" do

  describe "inicio de sesion" do
    it "no autentica con clave errada a usuario existente" do
      skip
		  usuario = Usuario.find_by(nusuario: 'sal7711')
      visit new_usuario_session_path 
			fill_in "Usuario", with: usuario.nusuario
			fill_in "Clave", with: 'ERRADA'
			click_button "Iniciar Sesión"
		  expect(page).not_to have_content("Administrar")
    end

    it "autentica con usuario creado en prueba" do
      skip
		  usuario = FactoryGirl.create(:usuario)
      visit new_usuario_session_path 
			fill_in "Usuario", with: usuario.nusuario
			fill_in "Clave", with: usuario.password
			click_button "Iniciar Sesión"
		  expect(page).to have_content("Administrar")
			usuario.destroy
    end

    it "autentica con usuario existente en base inicial" do
      skip
		  usuario = Usuario.find_by(nusuario: 'sal7711')
			usuario.password = 'sal7711'
      visit new_usuario_session_path 
			fill_in "Usuario", with: usuario.nusuario
			fill_in "Clave", with: usuario.password
			click_button "Iniciar Sesión"
		  expect(page).to have_content("Administrar")
    end

  end

end
