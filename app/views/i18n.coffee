class App.I18NView extends Mozart.View
  templateName: 'app/templates/i18n'

  init: ->
    super
    @set('categories',0)
    @set('products',0)
    @set('seconds',0)
