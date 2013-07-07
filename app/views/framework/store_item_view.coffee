class App.StoreItemView extends Mozart.BoundView
  templateName: 'app/templates/framework/store_item_view'
  tag: 'li'

  displayStore: (el, data, event) ->
    # Data is the options in the action tag.
    alert("App.StoreItemView: #{data.store.name}, #{data.store.country}, #{data.store.currency}")