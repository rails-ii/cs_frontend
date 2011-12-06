$ ->
  new Bootstrap("app").run()

class Bootstrap
  constructor: (@name) ->

  run: =>
    $("#task-list-ul").append("<li>finish this app</li>")
    $("#task-list-ul").append("<li>finish the lecture</li>")
