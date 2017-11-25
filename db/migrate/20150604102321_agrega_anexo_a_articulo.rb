class AgregaAnexoAArticulo < ActiveRecord::Migration[4.2]
  def change
    add_column :sal7711_gen_articulo, :anexo_id, :integer, null: false
    add_foreign_key :sal7711_gen_articulo, 
      :sip_anexo, column: :anexo_id
  end
end
