# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#sortable').sortable
    axis: 'y'
    items: '.item'

    update: (e, ui) ->
      item = ui.item
      item_data = item.data()
      params = { _method: 'put' }
      params[item_data.modelName] = { row_order_position: item.index() }
      $.ajax
        type: 'POST'
        url: item_data.updateUrl
        dataType: 'json'
        data: params