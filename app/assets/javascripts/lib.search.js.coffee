$ ->
  input = document.getElementById('near_location');
  options =
    types: ['(regions)'],
    componentRestrictions:
      {country: 'in'}
  autocomplete = new google.maps.places.Autocomplete(input, options);
  google.maps.event.addListener(autocomplete, 'place_changed', processSearchResult)

processSearchResult = ->
  place = this.getPlace()
  console.log('in')
  $(document).trigger("processSearchResult", [ place ])
