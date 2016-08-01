class RetiraFechaAnexo < ActiveRecord::Migration
  def change
    remove_column :sip_anexo, :fecha, :date
  end
end
