# sal7711_gen: Motor para manejo de un archivo de prensa
[![Estado Construcción](https://api.travis-ci.org/pasosdeJesus/sal7711_gen.svg?branch=master)](https://travis-ci.org/pasosdeJesus/sal7711_gen) [![Clima del Código](https://codeclimate.com/github/pasosdeJesus/sal7711_gen/badges/gpa.svg)](https://codeclimate.com/github/pasosdeJesus/sal7711_gen) [![Cobertura de Pruebas](https://codeclimate.com/github/pasosdeJesus/sal7711_gen/badges/coverage.svg)](https://codeclimate.com/github/pasosdeJesus/sal7711_gen) [![security](https://hakiri.io/github/pasosdeJesus/sal7711_gen/master.svg)](https://hakiri.io/github/pasosdeJesus/sal7711_gen/master) [![Dependencias](https://gemnasium.com/pasosdeJesus/sal7711_gen.svg)](https://gemnasium.com/pasosdeJesus/sal7711_gen) 

![Logo de sal7711](https://raw.githubusercontent.com/pasosdeJesus/sal7711_gen/master/spec/dummy/public/images/logo.jpg)


### Requerimientos
* Ruby version >= 2.2
* PostgreSQL >= 9.4 con extensión unaccent disponible
* Recomendado sobre adJ 5.6 (que incluye todos los componentes mencionados).  
  Las siguientes instrucciones suponen que opera en este ambiente.

Puede consultar como instalar estos componentes en: http://dhobsd.pasosdejesus.org/index.php?id=Ruby+on+Rails+en+OpenBSD

Es como otros motores, se recomienda ver cor1440_gen en
https://github.com/pasosdeJesus/cor1440_gen

### Configuración 

* Configure el formato de la fecha en config/application.rb bien con ```config.formato_fecha = 'yyyy-mm-dd'``` o  bien con ```config.formato_fecha = 'dd-mm-yyyy'```
* En el layout general que utilize asegurese de agregar:
```
<meta name="formato_fecha" content="<%= Rails.application.config.formato_fecha  ? Rails.application.config.formato_fecha : 'yyyy-mm-dd' %>">
```

