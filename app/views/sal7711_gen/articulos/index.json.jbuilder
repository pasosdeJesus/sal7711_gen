json.array!(@sal7711_gen_articulos) do |sal7711_gen_articulo|
  json.extract! sal7711_gen_articulo, :id, :departamento_id, :municipio_id, :fuenteprensa_id, :fecha, :pagina, :created_at, :updated_at
  json.url sal7711_gen_articulo_url(sal7711_gen_articulo, format: :json)
end
