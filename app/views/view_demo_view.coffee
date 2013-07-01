class App.ViewDemoView extends Mozart.View
  templateName: 'app/templates/view_demo_view'
  viewToDraw: App.CalledView

  afterRender: ->
    @childView('testcalledview').set("extraValue","Changed from App.ViewDemoView")

  doalert: (e) =>
    alert("doalert!")