module Sal7711Gen
  class HogarController < Sip::HogarController

    # Sin definir autorizacion porque es para no autenticados
    def index
      render layout: 'application'
    end

  end
end
