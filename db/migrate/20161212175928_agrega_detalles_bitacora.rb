class AgregaDetallesBitacora < ActiveRecord::Migration[5.0]
  def change
    add_column :sal7711_gen_bitacora, :detalle2, :string, limit:  500
    add_column :sal7711_gen_bitacora, :detalle3, :string, limit:  500
  end
end
