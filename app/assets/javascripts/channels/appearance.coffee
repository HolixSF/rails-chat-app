App.appearance = App.cable.subscriptions.create "AppearanceChannel",
connected: ->

disconnected: ->

received: (data) ->
  appearances = $('#appearances')
  appearances_html = ('<li class="list-group-item">' + appearance + '</li>' for appearance in data['appearances'])
  appearances.append(appearances_html.join(''))
  