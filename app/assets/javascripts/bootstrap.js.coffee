$ ->
  new Bootstrap("app").run()

class Bootstrap
  constructor: (@name) ->
    alert("here")

  run: =>
    alert(@name)
    alert("and here")
