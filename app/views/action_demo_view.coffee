class App.ActionDemoView extends Mozart.View
  templateName: 'app/templates/action_demo_view'

  mouseovervisible: false

  save: (e) =>
    alert("Saved")

  savemouseover: (el, options, event) =>
    @set('mouseovervisible', event.type=='mouseover')

  displayText: (e,data) =>
    alert(data.text)