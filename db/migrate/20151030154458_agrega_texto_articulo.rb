class AgregaTextoArticulo < ActiveRecord::Migration[4.2]
  def change
    add_column :sal7711_gen_articulo, :texto, :text
  end
end
