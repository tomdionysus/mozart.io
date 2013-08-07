class App.CheckboxControl extends Mozart.Control
  templateName: 'app/templates/controls/check_box_control'

  init: ->
    super
    @modelClass = Mozart.getPath(@model) if @model?
    @unsubscribe 'change:value', @updateValue
    @subscribe 'change:value', @updateValue

  afterRender: =>
    @controlEl = $("##{@id}-cbx")
    @updateValue()
    @setValue()

  updateValue: =>
    fire = @value!=@controlEl.prop('checked')
    @controlEl.prop('checked',@value)
    @parent?.trigger?('valueChanged',@) if fire

  setValue: ->
    fire = @value!=@controlEl.prop('checked')
    @set 'value', @controlEl.prop('checked')
    @parent?.trigger?('valueChanged',@) if fire

  change: ->
    @setValue()