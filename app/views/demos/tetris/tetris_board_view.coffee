class App.TetrisBoardView extends Mozart.View
  classHtml: 'tetris-board'
  skipTemplate: true

  boardHeight: 20
  boardWidth: 10

  blockHeight: 30
  blockWidth: 30

  blocks: []
  lastDrop: 0

  mode: 0

  lastLevelUp: 0

  init: =>
    super
    App.Application.domManager.bind("keyDown", @overallKeyDown)
    @bind 'change:boardHeight', @reset
    @bind 'change:boardWidth', @reset
    @bind 'change:blockHeight', @reset
    @bind 'change:blockWidth', @reset

    @logo = $("<div>").addClass('tetris-logo')
    logoy = (@boardHeight*@blockHeight/4) - 28
    logox = (@boardWidth*@blockWidth/2) - 116
    @logo.attr('style',"top:#{logoy}px;left:#{logox}px;")

    @gameover = $("<div>").addClass('tetris-gameover')
    logoy = (@boardHeight*@blockHeight/2) - 10
    logox = (@boardWidth*@blockWidth/2) - 88
    @gameover.attr('style',"top:#{logoy}px;left:#{logox}px;")

    @spacetoplay = $('<div>').addClass('tetris-msg')
    logoy = (@boardHeight*@blockHeight/4*3) - 23
    logox = (@boardWidth*@blockWidth/2) - 112
    @spacetoplay.attr('style',"top:#{logoy}px;left:#{logox}px;")

  overallKeyDown: (e) =>
    if @mode != 1
      if e.keyCode == 32
        @mode = 1
        @redraw()
    else
      if @activePiece?
        switch e.keyCode
          when 37
            @activePiece.position.x-- 
            e.preventDefault()
          when 39
            @activePiece.position.x++
            e.preventDefault()
          when 38
            @activePiece.rotate() 
            e.preventDefault()
          when 40
            @lastDrop = 0
            e.preventDefault()
        @activePiece.draw()

  blockClicked: (position, button) ->
    if @activePiece? and @mode == 1

      if position.y<=@activePiece.position.y
        @activePiece.rotate()
      else if position.y>@activePiece.position.y+4
        @lastDrop = 0
      else 
        if position.x<@boardWidth/2
          @activePiece.position.x--
        else
          @activePiece.position.x++

      @activePiece.draw()

    if @mode != 1
      @mode = 1
      @redraw()

  afterRender: =>
    switch @mode
      when 0
        @intro()
      when 1
        @game()

  intro: =>
    @game()
    @level = 6
    @element.append(@logo)
    @element.append(@spacetoplay)

    _.delay(@blinkMsg, 1000)

  blinkMsg: =>
    unless @released
      @spacetoplay.toggleClass('tetris-msg')
      _.delay(@blinkMsg, 1000) if @mode != 1

  reset: =>
    @mode = 0
    @redraw()

  game: =>
    @element.empty()
    @element.attr('style',"width:#{@boardWidth*@blockWidth}px;height:#{@boardHeight*@blockHeight}px;")
    @set 'score', 0
    @set 'level', 1
    @lastLevelUp = new Date().getTime()
    @destroyBoard()
    @createBoard()
    for col in @blocks
      for v in col
        @element.append(v.createElement())
    @createPiece()
    @drawBoard()
    _.delay(@gameTick,5)

  createBoard: =>
    for x in [0...@boardWidth]
      @blocks[x] = []
      for y in [0...@boardHeight]
        v = @layout.createView App.TetrisBlockView,
          parent: @
          classHtml: 'tetris-block'
          styleHtml: "width:#{@blockWidth-2}px;height:#{@blockHeight-2}px;top:#{y*@blockHeight+1}px;left:#{x*@blockWidth+1}px;"
          position: {x:x,y:y}
          blockIndex: 0
        @addView(v)
        v.redraw()
        @blocks[x][y] = v

  gameTick: =>
    t = new Date().getTime()
    if @lastDrop+(1000-(@level-1)*100) < t
      @randomMove() if @mode == 0
      unless @activePiece.dropOne()
        @scanCompleted()
        unless @createPiece()
          @element.append(@gameover)
          @element.append(@spacetoplay)
          @blinkMsg()
          if @mode == 0
            @redraw()
          else
            @mode = 3
          return
      @lastDrop = new Date().getTime()

    if @lastLevelUp+120000 < t
      @set('level',@level+1)
      @lastLevelUp = t

    _.delay(@gameTick,5)

  randomMove: =>
    m = Math.round(Math.random()*4)
    switch m
      when 0
        @activePiece.position.x-- 
      when 1
        @activePiece.position.x++
      when 2
        @activePiece.rotate()
    @activePiece.draw()

  drawBoard: =>
    @activePiece.draw()

  scanCompleted: =>
    y = @boardHeight-1
    while y>0
      if @rowComplete(y)
        @shiftDown(y)
        @set('score',@score+10)
      else
        y--

  rowComplete: (y) =>
    for x in [0...@boardWidth]
      return false if @blocks[x][y].blockIndex == 0
    return true

  shiftDown: (bottom) ->
    for y in [bottom...1]
      for x in [0...@boardWidth]
        @blocks[x][y].set('blockIndex', @blocks[x][y-1].blockIndex)
    for x in [0...@boardWidth]
      @blocks[x][0].set('blockIndex',0)

  destroyBoard: =>
    for col in @blocks
      for v in col
        v.release()
    @blocks = []

  setColor: (x,y,c) =>
    @blocks[x][y].set('blockIndex',c)

  createPiece: (type) =>
    @activePiece = App.TetrisBoardPiece.create
      board: @
      pieceType: Math.round(Math.random()*6)
      position: { x: Math.round(@boardWidth/2)-2, y:0}
    @activePiece.canDraw()

class App.TetrisBoardPiece extends Mozart.MztObject
  position: null
  lastPosition: null
  color: 1

  init: =>
    @color = @pieceType+1
    switch @pieceType
      when 0
        @shape = [[0,0,0,0],[1,1,1,1],[0,0,0,0],[0,0,0,0]]
      when 1
        @shape = [[0,0,0,0],[1,1,1,0],[0,0,1,0],[0,0,0,0]]
      when 2
        @shape = [[0,0,0,0],[1,1,1,0],[1,0,0,0],[0,0,0,0]]
      when 3
        @shape = [[0,0,0,0],[0,1,1,0],[0,1,1,0],[0,0,0,0]]
      when 4
        @shape = [[0,0,0,0],[0,1,1,0],[1,1,0,0],[0,0,0,0]]
      when 5
        @shape = [[0,0,0,0],[0,1,0,0],[1,1,1,0],[0,0,0,0]]
      else
        @shape = [[0,0,0,0],[1,1,0,0],[0,1,1,0],[0,0,0,0]]
        @color = 3
    
    @lastPosition = { x:@position.x,y:@position.y }
    @lastShape = @copyShape()

  draw: =>
    @undraw()

    unless @canDraw()
      @position = {x:@lastPosition.x, y:@lastPosition.y}
      @shape = @lastShape
      @draw() if @canDraw?
      return false

    for x in [0...4]
      for y in [0...4]
        @board.setColor(@position.x+x, @position.y+y, @color) if @shape[x][y] == 1
    @lastPosition = { x:@position.x,y:@position.y }
    true

  canDraw: =>
    for x in [0...4]
      for y in [0...4]
        if @shape[x][y] == 1
          return false if @position.x+x<0 or @position.y+y<0 or @position.x+x>@board.boardWidth-1 or @position.y+y>@board.boardHeight-1
          return false if @board.blocks[@position.x+x][@position.y+y].blockIndex !=0
    true

  undraw: =>
    for x in [0...4]
      for y in [0...4]
        if @shape[x][y] == 1
          return false if @lastPosition.x+x<0 or @lastPosition.y+y<0 or @lastPosition.x+x>@board.boardWidth-1 or @lastPosition.y+y>@board.boardHeight-1
          @board.setColor(@lastPosition.x+x, @lastPosition.y+y, 0)

  rotate: =>
    @undraw()
    @lastShape = @copyShape()
    @shape = @rotateShape()
    if @draw()
      @lastShape = @copyShape()
    else
      @shape = @lastShape
      

  copyShape: =>
    a = [[],[],[],[]]
    for x in [0...4]
      for y in [0...4]
        a[x][y] = @shape[x][y]
    a

  rotateShape: =>
    a = [[],[],[],[]]
    for x in [0...4]
      for y in [0...4]
        a[3-y][x] = @shape[x][y]
    a

  swapShapes: =>
    x = @shape
    @shape = @altShape
    @altShape = x  

  dropOne: =>
    @position.y++
    @draw()

