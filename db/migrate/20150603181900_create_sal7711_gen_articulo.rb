class CreateSal7711GenArticulo < ActiveRecord::Migration[4.2]
  def change
    create_table :sal7711_gen_articulo do |t|
      t.integer   :departamento_id
      t.integer   :municipio_id
      t.integer   :fuenteprensa_id, null: false
      t.date      :fecha, null: false
      t.string    :pagina, limit: 20, null: false
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    add_foreign_key :sal7711_gen_articulo, :sip_departamento, 
            column: :departamento_id
    add_foreign_key :sal7711_gen_articulo, :sip_municipio, 
            column: :municipio_id
    add_foreign_key :sal7711_gen_articulo, :sip_fuenteprensa,
            column: :fuenteprensa_id
  end
end
