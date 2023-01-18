ENV['RAILS_ENV'] ||= 'test'

require 'zeitwerk'
require 'simplecov'
Zeitwerk::Loader.eager_load_all # buscando que simplecov cubra más

require_relative 'dummy/config/environment'
require 'rails/test_help'

# Usuario para ingresar y hacer pruebas
PRUEBA_USUARIO = {
  nusuario: "admin",
  password: "sjrven123",
  nombre: "admin",
  descripcion: "admin",
  rol: 1,
  idioma: "es_CO",
  email: "usuario1@localhost",
  encrypted_password: '$2a$10$uMAciEcJuUXDnpelfSH6He7BxW0yBeq6VMemlWc5xEl6NZRDYVA3G',
  sign_in_count: 0,
  fechacreacion: "2014-08-05",
  fechadeshabilitacion: nil
}

class ActiveSupport::TestCase
end
