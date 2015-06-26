# encoding: UTF-8
module Sal7711Gen
  module ApplicationHelper
    def pagina(collection, params= {})
      # Solución de https://gist.github.com/jeroenr/3142686
      will_paginate collection, params.merge(
        :renderer => PaginacionAjaxHelper::GeneraEnlace
      )
    end
  end
end
