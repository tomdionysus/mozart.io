class App.TextControl extends Mozart.Control
  tag: 'input'
  skipTemplate: true

  init: ->
    super
    @subscribe 'change:value', @updateInputValue
      
  afterRender: =>
    @element[0].type = @typeHtml if @typeHtml?
    @updateInputValue()

  updateInputValue: =>
    return null unless @element?
    @element.val(@value)

  focus: ->
    @origValue = @value
    @element.focus()

  cancel: ->
    @set 'value', @origValue
    @element.val(@value)
    @element.blur()
    
  keyUp: (e) ->
    @set 'value', @element.val()