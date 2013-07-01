class App.NavBarView extends Mozart.View
  templateName: 'app/templates/nav_bar_view'
  roleHtml: "banner"
  tag: 'header'

  afterRender: ->
    #$('.dropdown-toggle').dropdown()
