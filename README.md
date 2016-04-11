# sal7711_gen: Motor para manejo de un archivo de prensa
[![Estado Construcción](https://api.travis-ci.org/pasosdeJesus/sal7711_gen.svg?branch=master)](https://travis-ci.org/pasosdeJesus/sal7711_gen) [![Clima del Código](https://codeclimate.com/github/pasosdeJesus/sal7711_gen/badges/gpa.svg)](https://codeclimate.com/github/pasosdeJesus/sal7711_gen) [![Cobertura de Pruebas](https://codeclimate.com/github/pasosdeJesus/sal7711_gen/badges/coverage.svg)](https://codeclimate.com/github/pasosdeJesus/sal7711_gen) [![security](https://hakiri.io/github/pasosdeJesus/sal7711_gen/master.svg)](https://hakiri.io/github/pasosdeJesus/sal7711_gen/master) [![Dependencias](https://gemnasium.com/pasosdeJesus/sal7711_gen.svg)](https://gemnasium.com/pasosdeJesus/sal7711_gen) 

![Logo de sal7711](https://raw.githubusercontent.com/pasosdeJesus/sal7711_gen/master/spec/dummy/public/images/logo.jpg)


### Requerimientos

* Ruby version >= 2.3
* Ruby on Rails 4.2.x
* PostgreSQL >= 9.4 con extensión unaccent disponible
* Recomendado sobre adJ 5.8 (que incluye todos los componentes mencionados) usando
  bundler con doas, ver [http://dhobsd.pasosdejesus.org/bundler-doas.html].  

Estas instrucciones suponen que opera en este ambiente, puedes ver más sobre
la instalación de Ruby on Rails en adJ en 
[http://dhobsd.pasosdejesus.org/Ruby_on_Rails_en_OpenBSD.html]

Es como otros motores, se recomienda ver cor1440_gen en
https://github.com/pasosdeJesus/cor1440_gen

### Configuración 

* Configure el formato de la fecha en config/application.rb bien con ```config.x.formato_fecha = 'yyyy-mm-dd'``` o  bien con ```config.x.formato_fecha = 'dd-mm-yyyy'```

