# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = undefined
set_positions = undefined

set_positions = ->
  $('.card').each (i) ->
    $(this).attr 'data-pos', i + 1 #pozicija portfolia
    return
  return

ready = ->
  set_positions()
  $('.sortable').sortable() #calling sortable method from html.sortable.js
  $('.sortable').sortable().bind 'sortupdate', (e, ui) ->
    updated_order = []
    set_positions() #uzima item koji je sortira i postavlja pozicije
    $('.card').each (i) ->
      updated_order.push
        id: $(this).data('id')
        position: i + 1
      return
    $.ajax      #komunicira sa railsom
      type: 'PUT' #put se poziva kada se menja vrednost
      url: '/portfoliopages/sort'
      data: order: updated_order
    return
  return

$(document).ready ready#kada se ucita stranica zelim da prosledim ready funkciju