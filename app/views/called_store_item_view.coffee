class App.CalledStoreItemView extends Mozart.BoundView
  templateName: 'app/templates/called_store_item_view'
  tag: 'li'

  displayStore: (el, data, event) ->
    # Data is the options in the action tag.
    alert("App.CalledStoreItemView: #{data.store.name}, #{data.store.country}, #{data.store.currency}")

