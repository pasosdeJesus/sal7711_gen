# encoding: UTF-8

require 'sip/concerns/models/usuario' 

module Sal7711Gen
	class Usuario < ActiveRecord::Base

    include Sip::Concerns::Models::Usuario  
  
    has_many :bitacoras, foreign_key: 'usuario_id',
      dependent: :destroy, class_name: 'Sal7711Gen::Bitacora'

	end
end
