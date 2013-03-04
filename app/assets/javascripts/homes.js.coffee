# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


home_image = $("[type=file]")
home_label_image = $("[for=home_image]")
home_label_image.bind("click", (evt)-> window.homeImageLabel = evt.target;)

onChange = (evt)->
	formData = new FormData()
	window.targetElement = evt.target
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
	label = window.homeImageLabel
	window.homeImageLabel = null
	img = document.createElement("img") 
	img.src = "/images/"+res['image_id']
	label.parentElement.replaceChild(img, label)
	image = document.createElement("input")
	image.hidden = true
	image.name = "image_ids[]"
	image.value = res["image_id"]
	$(".image_ids").append(image)


home_image.bind("change", onChange)

                