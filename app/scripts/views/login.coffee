define [
  'jquery'
  'underscore'
  'backbone'
  'templates',

  'models/session'
], ($, _, Backbone, JST, Session) ->
  class LoginView extends Backbone.View
    template: JST['app/scripts/templates/login.hbs']

    el: '#container'

    events:
      'submit form.login': 'submit'

    initialize: () ->
      # @listenTo @model, 'change', @render

    render: () ->
      @$el.html @template()

    submit: (event) ->
      _params = $(event.currentTarget).serialize()
      this.undelegateEvents()
      Session.login(_params)

      return false

