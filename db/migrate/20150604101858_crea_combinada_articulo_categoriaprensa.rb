class CreaCombinadaArticuloCategoriaprensa < ActiveRecord::Migration
  def change
    create_join_table :articulo, :categoriaprensa, {
      table_name: 'sal7711_gen_articulo_categoriaprensa' 
    }
    add_foreign_key :sal7711_gen_articulo_categoriaprensa, 
      :sal7711_gen_articulo, column: :articulo_id
    add_foreign_key :sal7711_gen_articulo_categoriaprensa, 
      :sal7711_gen_categoriaprensa, column: :categoriaprensa_id
  end
end
