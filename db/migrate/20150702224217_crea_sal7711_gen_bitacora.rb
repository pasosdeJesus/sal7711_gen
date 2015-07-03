class CreaSal7711GenBitacora < ActiveRecord::Migration
  def change
    create_table :sal7711_gen_bitacora do |t|
      t.timestamp :fecha
      t.string :ip, limit: 100
      t.integer :usuario_id
      t.string :operacion, limit: 50
      t.string :detalle, limit: 5000
    end
    add_foreign_key :sal7711_gen_bitacora, :usuario, foreign_key: :usuario_id
  end
end
