source 'https://rubygems.org'

#ruby "2.2.2"

# Rails (internacionalización)
#gem "rails", '~> 5.2.0'
# Resuelve problema con minitest y rails 5.2.0
gem "rails", '~> 5.2.0'

gem 'bootsnap',  '>=1.1.0', require: false

gem "rails-i18n"

# Postgresql
gem "pg"#, '~> 0.21'

gem 'puma'

gem 'bigdecimal'

# Colores en consola
gem "colorize"

# Para generar CSS
gem "sass"
gem "sass-rails"

# Cuadros de selección para búsquedas
gem 'chosen-rails'

# Para generar PDF
gem "prawn"

# API JSON facil. Ver: https://github.com/rails/jbuilder
gem "jbuilder"

# Uglifier comprime recursos Javascript
gem "uglifier"#, '>= 1.3.0'

# CoffeeScript para recuersos .js.coffee y vistas
gem "coffee-rails"#, '~> 4.1.0'

# jquery como librería JavaScript
gem "jquery-rails"

gem "jquery-ui-rails"

# Seguir enlaces más rápido. Ver: https://github.com/rails/turbolinks
gem "turbolinks"

# Ambiente de CSS
gem "twitter-bootstrap-rails"
gem "bootstrap-datepicker-rails"
gem "font-awesome-rails"

# Formularios simples 
gem "simple_form"

# Formularios anidados (algunos con ajax)
#gem "cocoon", git: "https://github.com/vtamara/cocoon.git", branch: 'new_id_with_ajax'


# Autenticación y roles
gem "devise"
gem "devise-i18n"
gem "cancancan"
gem "bcrypt"

# Listados en páginas
gem "will_paginate"

# ICU con CLDR
gem 'twitter_cldr'

# Maneja adjuntos
gem "paperclip"#, "~> 4.1"

# Zonas horarias
gem "tzinfo"

# Motor de sistemas de información estilo Pasos de Jesús
gem 'sip', git: "https://github.com/pasosdeJesus/sip.git"
#gem 'sip', path: '../sip'

# Los siguientes son para desarrollo o para pruebas con generadores
group :development do
  # Depurar
  #gem 'byebug'

  # Consola irb en páginas con excepciones o usando <%= console %> en vistas
  gem 'web-console'
end

# Los siguientes son para pruebas y no tiene generadores requeridos en desarrollo
group :test do

  gem 'simplecov'

  # Acelera ejecutando en fondo.  https://github.com/jonleighton/spring
  gem "spring"

  gem "connection_pool"
  gem "minitest-reporters" 

  #gem 'byebug'

  # https://www.relishapp.com/womply/rails-style-guide/docs/developing-rails-applications/bundler
  # Lanza programas para examinar resultados
  gem "launchy"

  #gem "codeclimate-test-reporter", require: nil
  # Para examinar errores, usar "rescue rspec" en lugar de "rspec"
  gem 'pry-rescue'
  gem 'pry-stack_explorer'

  gem 'meta_request'
end


group :production do
  # Para despliegue
  gem "unicorn"

  # Requerido por heroku para usar stdout como bitacora
  gem "rails_12factor"
end


