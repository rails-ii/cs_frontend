$ ->
  new Bootstrap("app").run()

class TaskManager
  constructor: (@tasks) ->

class Task
  constructor: (@name) ->

class ServerSide
  constructor: ->
    @baseUrl = "http://localhost:3001"

  createTask: (name, onConfirm) =>
    $.post("#{@baseUrl}/tasks", {name : name}, onConfirm)

  loadModel: (onLoaded) =>
    $.get("#{@baseUrl}/tasks", {}, onLoaded)

            

class Bootstrap
  constructor: (@name) ->
    @serverSide = new ServerSide()
    @serverSide.loadModel(@onModelLoaded)

  onModelLoaded: (data) =>
    console.log("model loaded")
    console.log(data)
    task = new Task("finish this app")
    @manager = new TaskManager([task])

  run: =>
    $("#task-form").submit(@onNewTaskSubmit)

  addTaskToList: (taskName) =>
    $("#task-list-ul").append("<li>#{taskName}</li>")

  onNewTaskSubmit: (event) =>
    event.preventDefault()
    element = $("#new-task-name")
    taskName = element.val()
    @addTaskToList(taskName)
    element.val("")
    @serverSide.createTask(taskName, (e) -> console.log("added on server"))
