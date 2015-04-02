require 'sip/version'

Sip.setup do |config|
      config.ruta_anexos = "/var/www/htdocs/sal7711/anexos"
      config.ruta_volcados = "/var/www/htdocs/sal7711/db"
      # En heroku los anexos son super-temporales
      if ENV["HEROKU_POSTGRESQL_MAUVE_URL"]
        config.ruta_anexos = "#{Rails.root}/tmp/"
      end
      config.titulo = "Sal7711 - Versión " + Sip::VERSION
end
