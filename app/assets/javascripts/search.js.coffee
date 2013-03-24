$ ->
  $(document).on("processSearchResult", (evt, place) ->
    service = new google.maps.places.PlacesService($('.place_service')[0])
    request =
      location: new google.maps.LatLng(place.geometry.location.kb, place.geometry.location.lb)
      radius: 50000
      keyword:'food'
    service.radarSearch(request, (result, status) -> console.log(result); console.log(status))
  )