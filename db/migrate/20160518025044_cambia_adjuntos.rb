# encoding: UTF-8

class CambiaAdjuntos < ActiveRecord::Migration
  def up
    add_attachment :sal7711_gen_articulo, :adjunto
    add_column :sal7711_gen_articulo, :anexo_id_antiguo, :integer
    add_column :sal7711_gen_articulo, :adjunto_descripcion, :string, limit: 1500
    execute <<-SQL
    UPDATE sal7711_gen_articulo SET 
      adjunto_file_name=sip_anexo.adjunto_file_name,
      adjunto_content_type=sip_anexo.adjunto_content_type,
      adjunto_file_size=sip_anexo.adjunto_file_size,
      adjunto_updated_at=sip_anexo.adjunto_updated_at,
      anexo_id_antiguo=sip_anexo.id,
      adjunto_descripcion=sip_anexo.descripcion
      FROM sip_anexo WHERE anexo_id=sip_anexo.id;
    SQL
    r=Sal7711Gen::Articulo.all
    puts r.count
    r.each do |a|
      puts a.anexo_id
      anexo=Sip::Anexo.find(a.anexo_id)
      puts anexo.id
      rutaorig = File.join(
        Sip.ruta_anexos, 
        "#{anexo.id}_#{anexo.adjunto_file_name}"
      )
      dirdest = File.join(
        Sip.ruta_anexos, 
        a.fecha.year.to_s, 
        a.fecha.month.to_s.rjust(2, '0'),
        a.fecha.day.to_s.rjust(2, '0')
      )
      puts `mkdir -p #{dirdest}`
      rutadest = File.join(
        dirdest,
        "#{a.id}_#{a.adjunto_file_name}"
      )
      puts `mv #{rutaorig} #{rutadest}`
    end
    #remove_foreign_key :sal7711_gen_articulo, :sip_anexo
    remove_column :sal7711_gen_articulo, :anexo_id
  end

  def down
    add_column :sal7711_gen_articulo, :anexo_id, :integer
    execute <<-SQL
    UPDATE sal7711_gen_articulo SET anexo_id=anexo_id_antiguo
    SQL
    add_foreign_key :sal7711_gen_articulo, 
      :sip_anexo, column: :anexo_id
    r=Sal7711Gen::Articulo.all
    puts r.count
    r.each do |a|
      puts a.anexo_id
      rutaorig = File.join(
        Sip.ruta_anexos, 
        a.fecha.year.to_s, 
        a.fecha.month.to_s.rjust(2, '0'),
        a.fecha.day.to_s.rjust(2, '0'),
        "#{a.id}_#{a.adjunto_file_name}"
      )
      rutadest = File.join(
        Sip.ruta_anexos, 
        "#{a.anexo_id}_#{a.adjunto_file_name}"
      )
      puts `mv #{rutaorig} #{rutadest}`
    end
    remove_column :sal7711_gen_articulo, :anexo_id_antiguo, :integer
    remove_column :sal7711_gen_articulo, :adjunto_descripcion
    remove_attachment :sal7711_gen_articulo, :adjunto
  end
end
