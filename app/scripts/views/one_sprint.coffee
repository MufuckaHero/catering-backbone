define [
  'jquery'
  'underscore'
  'backbone'
  'templates'

  'models/sprint'

  'views/panel'
  'views/daily_menus'
], ($, _, Backbone, JST, SprintModel , PanelView, DailyMenusView) ->
  class OneSprintView extends Backbone.View
    template: JST['app/scripts/templates/one_sprint.hbs']

    el: '#container'

    panel: new PanelView()

    menus: new DailyMenusView()

    events: {}

    initialize: (options) ->
      @sprint = new SprintModel(id: options.id)
      @sprint.fetch()
      this.sprint.on('sync', this.render, this);  

    render: () ->
      @$el.html @template( 
        sprint: @sprint.toJSON()
      )
      
      @panel.$el = @$('#user_panel')
      @menus.$el = @$('#menus')
      @panel.render()
      @panel.delegateEvents()
      @menus.render()
      @menus.delegateEvents()

  return OneSprintView
     
