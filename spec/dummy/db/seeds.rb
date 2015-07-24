# encoding: UTF-8

conexion = ActiveRecord::Base.connection();

Sip::carga_semillas_sql(conexion, 'sip', :datos)
Sip::carga_semillas_sql(conexion, '../..', :cambios)
Sip::carga_semillas_sql(conexion, '../..', :datos)

# Usuario para primer ingreso sal771, sal7711
conexion.execute("INSERT INTO usuario 
  (nusuario, email, encrypted_password, password, 
    fechacreacion, created_at, updated_at, rol) 
  VALUES ('sal7711', 'sal7711@localhost', 
    '$2a$10$RzZB8e0HK/RF4jTnTB7kiOEa7Hc/pI.xBGaXqhjTm1YFHVFEPFKEG', 
    '', '2014-08-26', '2014-08-26', '2014-08-26', 1);")

