# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#//= require chosen-jquery
#//= require lazybox

# Basado en
# http://stackoverflow.com/questions/1184334/get-number-days-in-a-specified-month-using-javascript
# Mes inicial es 1
@diasEnMes= (month_year) ->
  p=month_year.split("-");
  mes=p[0] 
  anio=p[1] 
  return new Date(anio, mes, 0).getDate()

#
# Para autocompletación busca regitros que coincidan con lo ingresado por 
#   usuario en el campo s
#
# @param s {object} es campo texto con foco donde se busca 
# @param sel_id {string} selector de campo donde quedará identificación 
# @param fuente {mixed} arreglo, url o función que busca y retorna
#  datos de la forma label: 'l1', value: 'v1' 
#
# @return {void}
#
@busca_gen= (s, sel_id, fuente) ->
  s.autocomplete({
    source: fuente,
    minLength: 2,
    select: ( event, ui ) -> 
      if (ui.item) 
        $(sel_id).val(ui.item.value)
        s.val(ui.item.label)
        event.stopPropagation()
        event.preventDefault()
  })
  return

@sal7711_gen_prepara_eventos_comunes = (root) ->
#  $(document).on 'ready page:load',  -> 
#    $('[data-behaviour~=datepicker]').datepicker({
#      format: 'dd-mm-yyyy'
#      autoclose: true
#      todayHighlight: true
#      language: 'es'	
#    });

  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No hay resultados',
    placeholder_text_single: 'Elija una opción',
    width: '300px'

  $('#mundep').on 'focusin', (e) ->
    busca_gen($(this), "#mundep_id", "mundep.json")

  $('#categoria').on 'focusin', (e) ->
# Otro método para autocompletar, usable cuando son pocas opciones para elegir
#    este=$(this)
#    $.ajax({
#      url: "admin/categoriasprensa.json",
#      dataType: "json",
#      data: {
#        term: ''
#      }
#    }).done( (d) -> 
#        a = d.map( (f) -> 
#           return { 
#             value: f["id"],
#             label: f["codigo"] + " " + f["nombre"]
#           }
#        )
#        busca_gen(este, "#categoria_id", a)
#    )
    busca_gen($(this), "#categoria_id", (request, response) ->
      $.ajax({
        url: "admin/categoriasprensa.json",
        dataType: "json",
        data: {
          term: request.term,
          labelvalue: 1
        },
        success: ( data ) -> 
          a = data.map( (f) -> 
             return { 
               value: f["id"],
               label: f["codigo"] + " " + f["nombre"]
             }
          )
          response( a )
      })
    )
  # Ilumina la última vista
  $(document).on('click', 'a.muestra-imagen', (e) ->
    $('a.muestra-imagen').removeClass('ultimo-visto')
    $(this).addClass('ultimo-visto') 
  )

  $('#historial').on('click', (e) ->
    e.stopPropagation()
    e.preventDefault()
    $.get('bitacorausuario', (d) ->
      $('#resultados').html(d)
    )
  )

  $('#meses_rapido').on 'change', ->
    max = -1
    min = -1
    $("#meses_rapido option:selected").each( ->
      if max==-1 
        max = $(this).val()
      min = $(this).val()
      return
    )
    f = $('[data-behaviour~=datepicker]').first().data('datepicker').o.format
    if f == 'dd-mm-yyyy' 
      $("#fechaini").val("01-" + min)
      $("#fechaini").datepicker("update", "01-" + min)
      $("#fechafin").val(diasEnMes(max) + "-" + max)
      $("#fechafin").datepicker("update", diasEnMes(max) + "-" + max)
    else
      $("#fechaini").val(min + "-01")
      $("#fechafin").val(max + "-" + diasEnMes(max))
    marca = false
    op=[]
    $("#meses_rapido option").each( ->
      if $(this).val() == max
        marca = true
      if marca
        op.push($(this).val())
      if $(this).val() == min
        marca = false
      return
    )
    $("#meses_rapido").val(op)
    return
  return

