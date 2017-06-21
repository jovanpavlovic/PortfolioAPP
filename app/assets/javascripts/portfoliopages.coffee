# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = undefined

ready = ->
  $('.sortable').sortable() #calling sortable method from html.sortable.js
  return

$(document).ready ready #kada se ucita stranica zelim da prosledim ready funkciju