define [
  'jquery',
  'underscore',
  'backbone',
  'router',
  'moment',

  'models/session',
  'models/sprint',

  'collections/sprints',

  'views/contacts',
  'views/login',
  'views/sprints'
  'views/one_sprint'
], ($, _, Backbone, Router, moment, Session, Sprint, SprintsCollection, ContactsView, LoginView, SprintsView, OneSprintView) ->
  class Application
    @defaults = 
      api_endpoint: "http://localhost:3000/api/v1"

    constructor: (options = {}) ->
      @router = null
      @options = $.extend(Application.defaults, options)

    initialize: () ->
      this._initConfiguration()
      this._initRoutes()
      this._initEvents()
    
    _initConfiguration: ->
      self = this

      $.ajaxPrefilter \
        (options, originalOptions, jqXHR) ->
          options.url = "#{self.options.api_endpoint}#{options.url}"
          no
          
      $.ajaxSetup({
        'beforeSend': (xhr) ->
          xhr.setRequestHeader("Accept", "application/json")
      })

    _initRoutes: ->
      @router = new Router()

      @router.on 'route:login', (page) ->
        _view = new LoginView()
        _view.render()

      @router.on 'route:contacts', (page) ->
        _view = new ContactsView()
        _view.render()

      @router.on 'route:sprints', (page) ->
        _view = new SprintsView()
        _view.render()

      @router.on 'route:one_sprint', (id) ->
        _view = new OneSprintView(id: id)
        _view.render()

      Backbone.history.start()

    _initEvents: ->
      self = this

      Session.on 'change:auth', (session) ->
        self.checkAuth()

      # Check if user already logined
      Session.getAuth()

    checkAuth: ->
      if Session.get('auth') is true
        @router.navigate("sprints", {trigger: true})
      else
        @router.navigate("contacts", {trigger: true})

  return new Application()