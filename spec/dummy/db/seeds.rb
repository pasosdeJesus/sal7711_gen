# encoding: UTF-8

connection = ActiveRecord::Base.connection();

# Básicas de motor sip
l = File.readlines(
  Gem.loaded_specs['sip'].full_gem_path + "/db/datos-basicas.sql"
)
connection.execute(l.join("\n"))

# Cambios a básicas de sip
if File.exists?("../../db/cambios-basicas.sql")
	l = File.readlines("../../db/cambios-basicas.sql")
	connection.execute(l.join("\n"))
end

# Nuevas basicas de motor Sal7711Gen
if File.exists?("../../db/datos-basicasn.sql")
	l = File.readlines("../../db/datos-basicasn.sql")
	connection.execute(l.join("\n"));
end

# Usuario para primer ingreso
connection.execute("INSERT INTO usuario 
	(nusuario, email, encrypted_password, password, 
  fechacreacion, created_at, updated_at, rol) 
	VALUES ('sal7711gen', 'sal7711gen@localhost', 
	'$2a$10$uMAciEcJuUXDnpelfSH6He7BxW0yBeq6VMemlWc5xEl6NZRDYVA3G', 
	'', '2014-08-14', '2014-08-14', '2014-08-14', 1);")

