# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#//= require chosen-jquery

# Basado en
# http://stackoverflow.com/questions/1184334/get-number-days-in-a-specified-month-using-javascript
# Mes inicial es 1
@diasEnMes= (mes, anio) ->
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

@actualiza_fuente = () ->
    $('#buscar_fuente').trigger("chosen:updated")

@sal7711_gen_prepara_eventos_comunes = (root) ->
#  $(document).on 'ready page:load',  -> 
#    $('[data-behaviour~=datepicker]').datepicker({
#      format: 'dd-mm-yyyy'
#      autoclose: true
#      todayHighlight: true
#      language: 'es'	
#    });

  $('.chosen-select').chosen(
    allow_single_deselect: true
    no_results_text: 'No hay resultados',
    placeholder_text_single: 'Elija una opción',
    width: '100%'
  )

  $('#buscar_mundep').on('focusin', (e) ->
    busca_gen($(this), "#buscar_mundep_id", "mundep.json")
  )

  $('#buscar_categoria').on('focusin', (e) ->
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
#        busca_gen(este, "#buscar_categoria_id", a)
#    )
    busca_gen($(this), "#buscar_categoria_id", (request, response) ->
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
  )
  # Ilumina la última vista
  $(document).on('click', 'a.muestra-imagen', (e) ->
    $('a.muestra-imagen').removeClass('ultimo-visto')
    $(this).addClass('ultimo-visto') 
  )

  $(document).on('click', 'a.historial-filtro', (e) ->
    e.stopPropagation()
    e.preventDefault()
    # limpiar meses_rapido
    $('#buscar_meses_rapido>option:selected').prop('selected', false)
    a = ['fechaini', 'fechafin', 'mundep', 'categoria', 'fuente', 'pagina']
    for i of a
      df = $(this).attr('data-' + a[i] + 'filtro')
      $('#buscar_' + a[i]).val(df)
    $('#buscar_fuente').trigger("chosen:updated")
    return
  )

   
  $(document).on('click', '#limpiarfiltro', (e) ->
    setTimeout(actualiza_fuente, 500);
    # Si se limpia directamente se ejecuta antes de la acción
    # por defecto de limpiar y no se ve el cambio.
    return
  )
 
  $('#buscar_historial').on('click', (e) ->
    e.stopPropagation()
    e.preventDefault()
    $.get('bitacorausuario', (d) ->
      $('#resultados').html(d)
    )
  )


  $(document).on('click', '#imagen-acercar', (e) ->
    e.preventDefault();
    e.stopPropagation();
    cp = $('#imagen-detalle').width()*100/$('#imagen-detalle').parent().width();
    np = Math.floor(cp + 10)
    $('#imagen-detalle').width(np + "%");
    return
  )

  $(document).on('click', '#imagen-alejar', (e) ->
    e.preventDefault();
    e.stopPropagation();
    cp = $('#imagen-detalle').width()*100/$('#imagen-detalle').parent().width();
    if cp > 10
      np = Math.floor(cp - 10)
    else
      np = 0
    $('#imagen-detalle').width(np + "%");
    return
  )

  $('#buscar_meses_rapido').on('change', ->
    max = -1
    min = -1
    $("#buscar_meses_rapido option:selected").each( ->
      if max==-1 
        max = $(this).val()
      min = $(this).val()
      return
    )
    f = $('[data-behaviour~=datepicker]').first().data('datepicker').o.format
    if f == 'dd-mm-yyyy' 
      p = max.split("-");
      mesmax = p[0] 
      aniomax = p[1] 
      fini = "01-" + min
      ffin = diasEnMes(mesmax,aniomax) + "-" + max
    else if f == 'yyyy-mm-dd'
      p = max.split("-");
      mesmax = p[1] 
      aniomax = p[0] 
      fini = min + "-01"
      ffin = max + "-" + diasEnMes(mesmax, aniomax)
    $("#buscar_fechaini").val(fini)
    $("#buscar_fechaini").datepicker("update", fini)
    $("#buscar_fechafin").val(ffin)
    $("#buscar_fechafin").datepicker("update", ffin)

    marca = false
    op=[]
    $("#buscar_meses_rapido option").each( ->
      if $(this).val() == max
        marca = true
      if marca
        op.push($(this).val())
      if $(this).val() == min
        marca = false
      return
    )
    $("#buscar_meses_rapido").val(op)
    return
  )

  return

