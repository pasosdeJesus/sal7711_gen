# encoding: UTF-8

FactoryGirl.define do
  factory :sal7711_gen_categoriaprensa, class: 'Sal7711Gen::Categoriaprensa' do
		id 1000 # Buscamos que no interfiera con existentes
    codigo 'y'
    nombre "Categoriaprensa"
    fechacreacion "2015-05-11"
    created_at "2015-05-11"
  end
end
