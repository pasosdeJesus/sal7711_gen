class RetiraFechaAnexo < ActiveRecord::Migration
  def change
    remove_column :msip_anexo, :fecha, :date
  end
end
