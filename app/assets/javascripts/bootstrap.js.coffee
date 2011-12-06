$ ->
  new Bootstrap("app").run()

class TaskManager
  constructor: (@tasks, @eventBroker) ->

  adwTask(task): =>
    @tasks.push(..)
    @eventBroker.trigger("task:added", task)


class Task
  constructor: (@name) ->

class ServerSide
  constructor: ->
    @baseUrl = "http://localhost:3001"

  createTask: (name, onConfirm) =>
    $.post("#{@baseUrl}/tasks", {name : name}, onConfirm)

  loadModel: (onLoaded) =>
    $.getJSON("#{@baseUrl}/tasks", {}, onLoaded)

class TaskListView
  constructor: (@eventBroker) ->
    @eventBroker.bind("task:added", @addTaskToList)

  addTaskToList: (event) =>
    ...

    

class Bootstrap
  constructor: (@name) ->
    @serverSide = new ServerSide()
    @serverSide.loadModel(@onModelLoaded)
    @eventBroker = new EventBroker()

  onModelLoaded: (data) =>
    console.log("model loaded")
    console.log(data)
    @manager = new TaskManager([], @eventBroker)
    for taskData in data["tasks"]
      @manager.tasks.push(new Task(taskData["name"]))

    console.log(@manager.tasks)
    for task in @manager.tasks
      @addTaskToList(task.name)


  run: =>
    $("#task-form").submit(@onNewTaskSubmit)

  addTaskToList: (taskName) =>
    $("#task-list-ul").append("<li data-id=\"#{task.id}\">#{taskName}</li>")

  onNewTaskSubmit: (event) =>
    event.preventDefault()
    element = $("#new-task-name")
    taskName = element.val()
    @addTaskToList(taskName)
    @taskManager.tasks.push(new Task(taskName))
    element.val("")
    @serverSide.createTask(taskName, (e) -> console.log("added on server"))
