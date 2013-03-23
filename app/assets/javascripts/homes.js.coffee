# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


home_image = $("[type=file]")
imageUploaderCallback = (evt)->
	formData = new FormData()
	files = home_image[0].files
	$.each(files, (itemno)-> formData.append("images[]", files[itemno]))
	$.ajax
		"url": "/images"
		"data": formData
		"type": "POST"
		"processData": false
		"contentType": false
		"success": successEvent

successEvent = (res)->
  img = document.createElement("img")
  img.src = "/images/"+res['image_id']
  $(".images")[0].appendChild(img)
  setImageWidth()
  image = document.createElement("input")
  image.type="hidden"
  image.name = "home[image_ids][]"
  image.setAttribute('value', res["image_id"])
  $(".image_ids").append(image)

setImageWidth = ->
  images = $(".images")
  carouselWidth = (images[0].childElementCount)  * 180;
  console.log(carouselWidth)
  images[0].style.width =  carouselWidth + "px"


home_image.bind("change", imageUploaderCallback)
processSearchResult = ->
  place = this.getPlace()
  console.log(place)
  $(".lat")[0].setAttribute('value', place.geometry.location.lat())
  $(".lng")[0].setAttribute('value', place.geometry.location.lng())

$ ->
  setImageWidth()
  input = document.getElementById('near_location');
  options =
   types: ['(cities)'],
   componentRestrictions: {country: 'in'}
  autocomplete = new google.maps.places.Autocomplete(input, options);
  google.maps.event.addListener(autocomplete, 'place_changed', processSearchResult)
