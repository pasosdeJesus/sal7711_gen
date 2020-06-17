source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gemspec


gem 'bcrypt'

gem 'bigdecimal'

gem 'bootsnap',  '>=1.1.0', require: false

gem 'cancancan'

gem 'coffee-rails', '>= 5.0.0' # CoffeeScript para recuersos .js.coffee y vistas

gem 'devise' , '>= 4.7.2' # Autenticación 

gem 'devise-i18n', '>= 1.9.1'

gem 'jbuilder' # API JSON facil. Ver: https://github.com/rails/jbuilder

gem 'paperclip'#, '~> 4.1' # Maneja adjuntos

gem 'pg' # Postgresql

gem 'puma'

gem 'prawn' # Para generar PDF

gem 'rails', '~> 6.0.3.1'

gem 'rails-i18n', '>= 6.0.0'

gem 'sassc-rails' , '>= 2.1.2' # Para generar CSS

gem 'simple_form' , '>= 5.0.2' # Formularios simples 

gem 'twitter_cldr' # ICU con CLDR

gem 'tzinfo' # Zonas horarias

gem 'webpacker', '>= 5.1.1'

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

  gem 'web-console' , '>= 4.0.2' # Consola irb en páginas 

end


group :test do

  gem 'connection_pool'
 
  gem 'meta_request', '>= 0.7.2'
  
  gem 'minitest-reporters' 

  gem 'simplecov'

  gem 'spring' # Acelera ejecutando en fondo

end


group :production do
  
  gem 'unicorn' # Para despliegue

end


