# encoding: UTF-8

module Sal7711Gen
	class Usuario < Sip::Usuario
  
    has_many :bitacoras, foreign_key: 'usuario_id',
      dependent: :destroy, class_name: 'Sal7711Gen::Bitacora'

	end
end
