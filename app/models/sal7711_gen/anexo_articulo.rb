module Sal7711Gen
  class AnexoArticulo < ActiveRecord::Base
    belongs_to :anexo, class_name: 'Msip::Anexo', 
      foreign_key: 'anexo_id', optional: false
    belongs_to :articulo, 
      class_name: 'Sal7711Gen::Articulo', 
      foreign_key: 'articulo_id', optional: false
  end
end

