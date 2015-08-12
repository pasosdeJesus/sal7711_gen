# encoding: UTF-8
module Sal7711Gen
  module ApplicationHelper

    include ::FontAwesome::Rails::IconHelper
    include Sip::PaginacionAjaxHelper

    def desc_bitacora(entrada)
      r = ''
      if !entrada[:buscar]
        return ''
      end
      if ( (entrada[:buscar]['fechaini']  && entrada[:buscar][:fechaini] != '') ||
         (entrada[:buscar]['fechafin'] && entrada[:buscar]['fechafin'] != '') )
        r += "Fecha: #{entrada[:buscar]['fechaini']} - " +
          "#{entrada[:buscar]['fechafin']}. "
      end
      if (entrada[:buscar]['mundep'] && entrada[:buscar]['mundep'] != '')
        r += "Muncipio/Departamento: #{entrada[:buscar]['mundep']}. "
      end
      if (entrada[:buscar]['categoria'] && entrada[:buscar]['categoria'] != '')
        r += "Categoria: #{entrada[:buscar]['categoria']}. "
      end
      if (entrada[:buscar]['fuente'] && entrada[:buscar]['fuente'] != '')
        f = Sip::Fuenteprensa.find(entrada[:buscar]['fuente'])
        if f
          r += "Fuente: #{f.nombre}. "
        end
      end
      if  (entrada[:buscar]['pagina'] && entrada[:buscar]['pagina'] != '')
        r += "Página: #{entrada[:buscar]['pagina']}. "
      end
      
      return r
    end

  end
end
