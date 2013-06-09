getLocation = ->
  if navigator.geolocation
    navigator.geolocation.getCurrentPosition showPosition

showPosition = (position) ->
  lat = position.coords.latitude
  lng = position.coords.longitude
  $("#latitude").val position.coords.latitude
  $("#longitude").val position.coords.longitude
  geocoder = new google.maps.Geocoder()
  latlng = new google.maps.LatLng(lat, lng)
  geocoder.geocode
    latLng: latlng
  , (results, status) ->
    $("#formatted_address").val results[1].formatted_address if results[1] if status is google.maps.GeocoderStatus.OK

geocode_address = (submit_form = false) ->
  address = $("#formatted_address").val()
  if address != ""
    geocoder = new google.maps.Geocoder()

    # get location + formatted address from raw address input
    geocoder.geocode
      address: address + "+france"
    , (results, status) ->
      if status is google.maps.GeocoderStatus.OK
        $("#latitude").val results[0].geometry.location.jb
        $("#longitude").val results[0].geometry.location.kb
        $("#formatted_address").val results[0]["formatted_address"]
        $('.geolocation-alerts').html("")
        if submit_form
          $('.geolocation form').submit()
      else
        $('.geolocation-alerts').html("Adresse invalide")
  else
    getLocation()

$("#formatted_address").change ->
  geocode_address()

$('.geolocation input').keypress (e) ->
  e.keyCode != 13

$('.geolocation input[type=submit]').click (e) ->
  e.preventDefault()
  $(this).after('<input type="hidden" name="' + $(this).attr("name") + '" />')
  geocode_address(true)
  false

getLocation() if $(".geolocation").length > 0 && $("#formatted_address").val() == ""
