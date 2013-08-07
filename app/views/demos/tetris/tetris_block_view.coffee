class App.TetrisBlockView extends Mozart.View
  skipTemplate: true

  init: ->
    super
    @subscribe('change:blockIndex', @afterRender)

  afterRender: =>
    @setColor(@blockIndex)

  setColor: (idx) =>
    return unless @element?
    colors = ['generic','red','orange','blue','yellow','magenta','cyan','green']
    color = colors[idx]
    if color?
      for i in colors
        if color == i
          @element.addClass('tetris-block-'+i)
        else
          @element.removeClass('tetris-block-'+i)
    else
      for i in colors
        @element.removeClass('tetris-block-'+color)
      @element.addClass('tetris-block-generic')

  click: ->
    @parent.blockClicked(@position)


