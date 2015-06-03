# encoding: UTF-8

FactoryGirl.define do
  factory :sal7711_gen_articulo, class: 'Sal7711Gen::Articulo' do
    id 1000 # Buscamos que no interfiera con existentes
    fecha       "2015-06-03"
    pagina      "1A"
    fuenteprensa_id 1
    departamento_id 1
    created_at  "2015-06-03"
  end
end
