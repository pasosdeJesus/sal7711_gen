require 'sal7711_gen/version'

Msip.setup do |config|
  config.ruta_anexos = ENV.fetch('MSIP_RUTA_ANEXOS', 
                                 "#{Rails.root}/archivos/anexos")
  config.ruta_volcados = ENV.fetch('MSIP_RUTA_VOLCADOS',
                                   "#{Rails.root}/archivos/bd")
  # En heroku los anexos son super-temporales
  if ENV["HEROKU_POSTGRESQL_MAUVE_URL"]
    config.ruta_anexos = "#{Rails.root}/tmp/"
  end
  config.titulo = "Sal7711 Ver. #{Sal7711Gen::VERSION}"
  config.codigofuente = "https://gitlab.com/pasosdeJesus/sal7711_gen"
  config.urlcontribuyentes = "https://gitlab.com/pasosdeJesus/sal7711_gen/-/graphs/v2.2"
  config.urlcreditos = "https://gitlab.com/pasosdeJesus/sal7711_gen/blob/main/CREDITOS.md"
  config.urllicencia= "https://gitlab.com/pasosdeJesus/sal7711_gen/blob/main/LICENCIA.md"
  config.agradecimientoDios = "<p>
Agradecemos y dedicamos a Dios.
</p>
<blockquote>
<p>
Me acordaré de las obras de JAH;
Sí, haré yo memoria de tus maravillas antiguas.
</p><p>
Salmo 77:11
</p></blockquote>".html_safe
end
