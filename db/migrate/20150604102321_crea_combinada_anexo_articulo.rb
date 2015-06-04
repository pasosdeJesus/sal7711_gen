class CreaCombinadaAnexoArticulo < ActiveRecord::Migration
  def change
    create_join_table :anexo, :articulo, {
      table_name: 'sal7711_gen_anexo_articulo' 
    }
    add_foreign_key :sal7711_gen_anexo_articulo, 
      :sip_anexo, column: :anexo_id
    add_foreign_key :sal7711_gen_anexo_articulo, 
      :sal7711_gen_articulo, column: :articulo_id
  end
end
