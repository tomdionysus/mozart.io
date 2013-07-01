App.Store = Mozart.Model.create
  modelName: 'Store'

App.Store.attributes
  'name': 'string'
  'country': 'string'
  'currency': 'string'

App.Store.index 'name'