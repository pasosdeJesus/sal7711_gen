source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gemspec


gem 'bcrypt'

gem 'bigdecimal'

gem 'bootsnap',  '>=1.1.0', require: false

gem 'cancancan'

# Cuadros de selección para búsquedas
gem 'chosen-rails', git: 'https://github.com/vtamara/chosen-rails.git', branch: 'several-fixes'

gem 'coffee-rails'# CoffeeScript para recuersos .js.coffee y vistas

gem 'colorize' # Colores en consola

gem 'devise' # Autenticación 

gem 'devise-i18n'

gem 'font-awesome-rails'

gem 'jbuilder' # API JSON facil. Ver: https://github.com/rails/jbuilder

gem 'jquery-rails' # jquery como librería JavaScript

gem 'jquery-ui-rails'

gem 'paperclip'#, '~> 4.1' # Maneja adjuntos

gem 'pick-a-color-rails' # Facilita elegir colores en tema

gem 'pg' # Postgresql

gem 'puma'

gem 'prawn' # Para generar PDF

gem 'rails', '~> 6.0.0.rc1'

gem 'rails-i18n'

gem 'sass-rails' # Para generar CSS

gem 'simple_form' # Formularios simples 

gem 'tiny-color-rails'

gem 'turbolinks' # Seguir enlaces más rápido. 

gem 'twitter_cldr' # ICU con CLDR

gem 'tzinfo' # Zonas horarias

gem 'uglifier' # Uglifier comprime recursos Javascript

gem 'webpacker'

gem 'will_paginate' # Listados en páginas

#####
# Motores que se sobrecargan vistas (deben ponerse en orden de apilamiento 
# lógico y no alfabetico como las gemas anteriores)

gem 'sip', # Motor generico
   git: 'https://github.com/pasosdeJesus/sip.git', branch: :bs4
#gem 'sip', path: '../sip'


group :development, :test do
  
  #gem 'byebug' # Depurar

end



group :development do

  gem 'web-console' # Consola irb en páginas 

end


group :test do

  gem 'connection_pool'
 
  gem 'meta_request'
  
  gem 'minitest-reporters' 

  gem 'simplecov'

  gem 'spring' # Acelera ejecutando en fondo

end


group :production do
  
  gem 'unicorn' # Para despliegue

end


