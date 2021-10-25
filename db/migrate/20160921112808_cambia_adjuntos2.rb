class CambiaAdjuntos2 < ActiveRecord::Migration[5.0]
  def up
    r=Sal7711Gen::Articulo.all
    puts r.count
    r.each do |a|
      rutaorig = File.join(
        Sip.ruta_anexos, 
        a.fecha.year.to_s, 
        a.fecha.month.to_s.rjust(2, '0'),
        a.fecha.day.to_s.rjust(2, '0'),
        "#{a.id}_#{a.adjunto_file_name}"
      )
      dirdest = File.join(
        Sip.ruta_anexos, 
        a.created_at.year.to_s, 
        a.created_at.month.to_s.rjust(2, '0'),
        a.created_at.day.to_s.rjust(2, '0')
      )
      FileUtils.mkdir_p dirdest, verbose: true
      rutadest = File.join(
        dirdest,
        "#{a.id}_#{a.adjunto_file_name}"
      )
      puts "#{rutaorig}->#{rutadest}"
      if rutaorig != rutadest
        FileUtils.mv rutaorig, rutadest, verbose: true, force: true
      end
    end
  end

  def down
    r=Sal7711Gen::Articulo.all
    puts r.count
    r.each do |a|
      rutaorig= File.join(
        Sip.ruta_anexos, 
        a.created_at.year.to_s, 
        a.created_at.month.to_s.rjust(2, '0'),
        a.created_at.day.to_s.rjust(2, '0'),
        "#{a.id}_#{a.adjunto_file_name}"
      )
      dirdest = File.join(
        Sip.ruta_anexos, 
        a.fecha.year.to_s, 
        a.fecha.month.to_s.rjust(2, '0'),
        a.fecha.day.to_s.rjust(2, '0')
      )
      FileUtils.mkdir_p dirdest, verbose: true
      rutadest= File.join(
        dirdest,
        "#{a.id}_#{a.adjunto_file_name}"
      )
      puts "#{rutaorig}->#{rutadest}"
      if rutaorig != rutadest
        FileUtils.mv rutaorig, rutadest, verbose: true
      end
    end
  end

end
