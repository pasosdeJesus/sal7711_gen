require 'sal7711_gen/version'

Sip.setup do |config|
      config.ruta_anexos = "/var/www/resbase/sal7711/"
      config.ruta_volcados = "/var/www/resbase/sal7711/bd"
      # En heroku los anexos son super-temporales
      if ENV["HEROKU_POSTGRESQL_MAUVE_URL"]
        config.ruta_anexos = "#{Rails.root}/tmp/"
      end
      config.titulo = "Sal7711 Ver. " + Sal7711Gen::VERSION
end
