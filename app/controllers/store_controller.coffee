class App.StoreController extends Mozart.Controller

  currentStore: null
  editingStore: null
  editVisible: false
  sortBy: 'name'
  largeItemArray: []

  
  init: ->
    @set('searchtext', "")
    @set('stores',App.Store)
    @resetDemo()

    for i in [1..23]
      @largeItemArray.push {id:i, name:"Item #{i}"}

  newStore: =>
    @set('currentStore',App.Store.initInstance())
    @set('editingStore',@currentStore.copyTo())
    @set('addSaveButtonText','Create')
    @set('editVisible', true)

  editStore: (el, data, event) =>
    console.log("store", data.store)
    @set('currentStore',data.store)
    @set('editingStore',data.store.copyTo())
    @set('addSaveButtonText','Save')
    @set('editVisible', true)

  saveStore: =>
    @currentStore.copyFrom(@editingStore)
    @currentStore.save()
    @set('editVisible', false)

  cancelStore: =>
    @set('editVisible', false)

  removeStore: (el, data, event) ->
    data.store.destroy()

  resetDemo: ->
    App.Store.reset()

    App.Store.createFromValues
      name: 'Tom\'s Store'
      country: 'Ireland'
      currency: 'EUR'
    App.Store.createFromValues
      name: 'Dave\'s Store'
      country: 'America'
      currency: 'USD'
    App.Store.createFromValues
      name: 'Tim\'s Store'
      country: 'Australia'
      currency: 'AUD'
    App.Store.createFromValues
      name: 'Chris\'s Store'
      country: 'Germany'
      currency: 'EUR'

    App.Store.trigger('change')

  save: ->
    alert("Save on Controller")

  sortByFields: [
    {id:'name',name:'Name'},
    {id:'country',name:'Country'},
    {id:'currency',name:'Currency'},
  ]