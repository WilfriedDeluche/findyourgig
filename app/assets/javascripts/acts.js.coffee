jQuery ->
  $('[data-toggle=button]').click ->
    if $(this).hasClass("active")
      $(this).removeClass("active")
      $(this).siblings(".destroy-entity").each ->
        $(this).val("false")
    else
      $(this).addClass("active")
      $(this).siblings(".destroy-entity").each ->
        $(this).val("true")
