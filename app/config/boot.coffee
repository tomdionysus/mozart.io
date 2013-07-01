window.App = @Demo = Demo = {}

App.log = (status) ->
  console.log("LOG:", status)

App.warn = (status) ->
  console.log("WARNING:", status)

App.title = (title) ->
  window.title = title