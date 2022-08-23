class QuitaMunSal7711 < ActiveRecord::Migration[7.0]
  def up
    if Sal7711Gen::Articulo.
        where(departamento_id: 3).count > 0
      puts "Hay artículos en EXTERIOR pero no hay pais"
      exit 1
    end
  end

  def down
  end
end
