# sal7711_gen: Motor para manejo de un archivo de prensa
[![Estado Construcción](https://api.travis-ci.org/pasosdeJesus/sal7711_gen.svg?branch=master)](https://travis-ci.org/pasosdeJesus/sal7711_gen) [![Clima del Código](https://codeclimate.com/github/pasosdeJesus/sal7711_gen/badges/gpa.svg)](https://codeclimate.com/github/pasosdeJesus/sal7711_gen) [![Cobertura de Pruebas](https://codeclimate.com/github/pasosdeJesus/sal7711_gen/badges/coverage.svg)](https://codeclimate.com/github/pasosdeJesus/sal7711_gen) [![security](https://hakiri.io/github/pasosdeJesus/sal7711_gen/master.svg)](https://hakiri.io/github/pasosdeJesus/sal7711_gen/master) [![Dependencias](https://gemnasium.com/pasosdeJesus/sal7711_gen.svg)](https://gemnasium.com/pasosdeJesus/sal7711_gen) 

![Logo de sal7711](https://raw.githubusercontent.com/pasosdeJesus/sal7711_gen/master/test/dummy/public/images/logo.jpg)


## Uso

### Requerimientos Tecnológicos

Ver <https://github.com/pasosdeJesus/sip/wiki/Requerimientos>

## Pruebas

Es posible ejecutar una aplicación de prueba incluida con este motor así
como pruebas de regresión que la usan.  Favor revisar estos aspectos en
otro motor que es análogo a este, ver 
<https://github.com/pasosdeJesus/sivel2_gen/

## Configuración 

* Configure el formato de la fecha en ```config/application.rb``` bien 
  con ```config.x.formato_fecha = 'yyyy-mm-dd'``` o  bien con 
  ```config.x.formato_fecha = 'dd-mm-yyyy'```
* El directorio donde se almacenan los artículos sin conversión
  (e.g .tif) es el de anexos configurable en config/initializers/sip.rb
  Se creará una estructura de directorios con base en la fecha del
  artículo.
* El colchón para artículos es un directorio en ```public``` o usable 
  por el servidor web donde se dejan .jpg y .pdf convertidos a partir de los
  anexos (tipicamente .tif).  Su ubicación se configura en
  ```config.x.url_colchon``` por defecto es  ```colchon-articulos```
* Debe haber un enlace del colchon de artículos a 
  ```public/images/colchon-articulos```
* En app/assets/javascripts/application.rb se debe definir root, se espera 
  que sea window 

