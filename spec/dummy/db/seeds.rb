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
if File.exists?("../../db/datos-basicas.sql")
	l = File.readlines("../../db/datos-basicas.sql")
	connection.execute(l.join("\n"));
end

# Usuario para primer ingreso
connection.execute("INSERT INTO usuario 
  (nusuario, email, encrypted_password, password, 
    fechacreacion, created_at, updated_at, rol) 
  VALUES ('sal7711', 'sal7711@localhost', 
    '$2a$10$RzZB8e0HK/RF4jTnTB7kiOEa7Hc/pI.xBGaXqhjTm1YFHVFEPFKEG', 
    '', '2014-08-26', '2014-08-26', '2014-08-26', 1);")

