class CreaSipOficina < ActiveRecord::Migration
  def change
    execute <<-SQL
      CREATE SEQUENCE sip_oficina_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;
    
      CREATE TABLE sip_oficina (
        id integer DEFAULT nextval('sip_oficina_id_seq'::regclass) NOT NULL,
        nombre character varying(50) NOT NULL,
        fechacreacion date DEFAULT ('now'::text)::date NOT NULL,
        fechadeshabilitacion date,
        created_at timestamp without time zone,
        updated_at timestamp without time zone,
        CONSTRAINT oficina_check CHECK 
          (((fechadeshabilitacion IS NULL) OR 
           (fechadeshabilitacion >= fechacreacion)))
      );
    SQL
  end
end
