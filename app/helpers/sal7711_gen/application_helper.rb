# encoding: UTF-8
module Sal7711Gen
  module ApplicationHelper
    def pagina(collection, params= {})
      # Solución de https://gist.github.com/jeroenr/3142686
      will_paginate collection, params.merge(
        :renderer => PaginacionAjaxHelper::GeneraEnlace
      )
    end

    def desc_bitacora(entrada)
      r = ''
      if ( (entrada['fechaini']  && entrada['fechaini'] != '') ||
         (entrada['fechafin'] && entrada['fechafin'] != '') )
        r += "Fecha: #{entrada['fechaini']} - #{entrada['fechafin']}. "
      end
      if (entrada['mundep'] && entrada['mundep'] != '')
        r += "Muncipio/Departamento: #{entrada['mundep']}. "
      end
      if (entrada['categoria'] && entrada['categoria'] != '')
        r += "Categoria: #{entrada['categoria']}. "
      end
      if (entrada['fuente'] && entrada['fuente']['nombre'] && 
          entrada['fuente']['nombre'] != '')
        r += "Fuente: #{entrada['fuente']}. "
      end
      if  (entrada['pagina'] && entrada['pagina'] != '')
        r += "Página: #{entrada['pagina']}. "
      end
      
      return r
    end

  end
end
