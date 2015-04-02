$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sal7711_gen/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sal7711_gen"
  s.version     = Sal7711Gen::VERSION
  s.authors     = ["Vladimir Támara Patiño"]
  s.email       = ["vtamara@pasosdeJesus.org"]
  s.homepage    = "http://github.com/pasosdeJesus/sal7711_gen"
  s.summary     = "Motor para Archivo de Prensa Genérico"
  s.description = "Partes comunes a diversos Archivos de Prensa"
  s.license     = "Dominio Público de acuerdo a Legislación Colombiana"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENCIA.md", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails"
  s.add_dependency "sip"
end
