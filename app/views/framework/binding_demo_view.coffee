class App.BindingDemoView extends Mozart.View
  templateName: 'app/templates/framework/binding_demo_view'

  init: ->
    super

  doButtonAlert: ->
    alert(Mozart.getPath("App.storeController.searchtext"))