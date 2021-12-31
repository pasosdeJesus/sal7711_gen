module Sal7711Gen
  class ArticuloCategoriaprensa < ActiveRecord::Base
    belongs_to :articulo, class_name: 'Sal7711Gen::Articulo', 
      foreign_key: 'articulo_id', optional: false
    belongs_to :categoriaprensa, 
      class_name: 'Sal7711Gen::Categoriaprensa', 
      foreign_key: 'categoriaprensa_id', optional: false
  end
end

