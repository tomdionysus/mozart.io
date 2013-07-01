class App.SelectControl extends Mozart.Control
  templateName: 'app/templates/controls/select_control'
  disableHtmlAttributes: true

  init: ->
    super
    @controlId = "#{@id}-ddl"
    @nullValue ?= null
    @nullAllowed ?= false
    @nulltext ?= "Choose..."

    @modelClass = Mozart.getPath(@model) if @model?

    @bind 'change:value', @updateValue
    @bind 'change:content', @redraw

  afterRender: =>
    @controlEl = $("#"+@controlId)
    @copyHtmlAttrsToElement(@controlEl)
    @updateValue()
    @setValue()

  updateValue: =>
    if @model? 
      if @value?
        @controlEl.val(@value.id)
      else
        @controlEl.val(null)
    else
      @controlEl.val(@value)

  setValue: ->
    if @model?
      if @modelClass.findById(@controlEl.val()) == undefined
        @set 'value', @nullValue
      else
        @set 'value', @modelClass.findById(@controlEl.val())
    else
      @set 'value', @controlEl.val()

  change: ->
    @setValue()
