source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gemspec


gem 'bcrypt'

gem 'bigdecimal'

gem 'bootsnap',  '>=1.1.0', require: false

gem 'cancancan'

gem 'coffee-rails'# CoffeeScript para recuersos .js.coffee y vistas

gem 'devise' # Autenticación 

gem 'devise-i18n'

gem 'jbuilder' # API JSON facil. Ver: https://github.com/rails/jbuilder

gem 'nokogiri', '>=1.11.0.rc4'

gem 'paperclip'#, '~> 4.1' # Maneja adjuntos

gem 'pg' # Postgresql

gem 'puma'

gem 'prawn' # Para generar PDF

gem 'rails', '~> 6.1.0'

gem 'rails-i18n'

gem 'sassc-rails' # Para generar CSS

gem 'simple_form' # Formularios simples 

gem 'twitter_cldr' # ICU con CLDR

gem 'tzinfo' # Zonas horarias

gem 'webpacker'

gem 'will_paginate' # Listados en páginas

#####
# Motores que se sobrecargan vistas (deben ponerse en orden de apilamiento 
# lógico y no alfabetico como las gemas anteriores)

gem 'sip', # Motor generico
  git: 'https://github.com/pasosdeJesus/sip.git'
  #path: '../sip'


group :development, :test do
  
  #gem 'byebug' # Depurar

  gem 'colorize' # Colores en consola

end



group :development do

  gem 'web-console' # Consola irb en páginas 

end


group :test do

  gem 'connection_pool'
 
  gem 'meta_request'
  
  gem 'minitest-reporters' 

  gem 'simplecov', '<0.18' # Debido a https://github.com/codeclimate/test-reporter/issues/418

  gem 'spring' # Acelera ejecutando en fondo

end


group :production do
  
  gem 'unicorn' # Para despliegue

end


