App.Customer = Mozart.Model.create
  modelName: 'Customer'

App.Customer.attributes
  'name':'string'

App.Customer.ajax
  singular: 'customer'
  plural: 'customers'
  url: '/customers'
  interface: 'REST'