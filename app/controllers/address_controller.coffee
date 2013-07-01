class App.AddressController extends Mozart.Controller
  
  currentCountry: false
  currentState: false
  currentCity: false

  addressText: 'Text From AddressController'

  init: ->
    @set('countries',App.Country)
    @set('states',App.State)
    @set('cities',App.Cities)
    @resetDemo()

    @bind('change:currentCountry', @checkCurrentCountry)
    @bind('change:currentState', @checkCurrentState)

  checkCurrentCountry: =>
    @set('currentState',false) if @currentCountry == false

  checkCurrentState: =>
    @set('currentCity',false) if @currentState == false

  resetDemo: ->
    App.Country.reset()
    App.State.reset()
    App.City.reset()

    aus = App.Country.createFromValues
      name: 'Australia'
    
    nz = App.Country.createFromValues
      name: 'New Zealand'

    ire = App.Country.createFromValues
      name: 'Ireland'

    nsw = aus.states().createFromValues
      name: 'NSW'

    qld = aus.states().createFromValues
      name: 'QLD'

    wel = nz.states().createFromValues
      name: 'Wellington'

    ctr = nz.states().createFromValues
      name: 'Canterbury'

    dwn = ire.states().createFromValues
      name: 'Antrim'

    crk = ire.states().createFromValues
      name: 'Dublin'

    nsw.cities().createFromValues
      name: 'Sydney'

    nsw.cities().createFromValues
      name: 'Bondi'

    qld.cities().createFromValues
      name: 'Brisbane'

    qld.cities().createFromValues
      name: 'Cairns'

    wel.cities().createFromValues
      name: 'Wellington'

    ctr.cities().createFromValues
      name: 'Christchurch'

    dwn.cities().createFromValues
      name: 'Belfast'

    crk.cities().createFromValues
      name: 'Dublin'
