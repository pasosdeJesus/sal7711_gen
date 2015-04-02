# encoding: UTF-8
begin
  require 'bundler/setup'
rescue LoadError
  puts 'Debe instalar `gem install bundler` y `bundle install` para correr tareas rake'
end

require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Sal7711Gen'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.md')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

# Usando rspec en motor segun http://viget.com/extend/rails-engine-testing-with-rspec-capybara-and-factorygirl
APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'

Bundler::GemHelper.install_tasks

Dir[File.join(File.dirname(__FILE__), 'tasks/**/*.rake')].each {|f| load f }
require 'rspec/core'
require 'rspec/core/rake_task'
require 'rake/testtask'

task default: 'app:spec'
