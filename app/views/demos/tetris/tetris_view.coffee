class App.TetrisView extends Mozart.View
  templateName: 'app/templates/demos/tetris/tetris_view'

  restart: =>
    @childView('tetrisboard').reset()
