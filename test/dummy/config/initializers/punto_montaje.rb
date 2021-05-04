Dummy::Application.config.relative_url_root = ENV.fetch(
  'RUTA_RELATIVA', '/sal7711')
Dummy::Application.config.assets.prefix = ENV.fetch(
  'RUTA_RELATIVA', '/sal7711') + '/assets'
