$ ->
  new Bootstrap("app").run()

class Bootstrap
  constructor: (@name) ->

  run: =>
    @addTaskToList("finish this app")

    $("#task-form").submit(@onNewTaskSubmit)

  addTaskToList: (taskName) =>
    $("#task-list-ul").append("<li>#{taskName}</li>")

  onNewTaskSubmit: (event) =>
    event.preventDefault()
    element = $("#new-task-name")
    taskName = element.val()
    @addTaskToList(taskName)
    element.val("")


    baseUrl = "http://localhost:3001"
    $.post("#{baseUrl}/tasks", {name : taskName},
            -> console.log("added on server"))
