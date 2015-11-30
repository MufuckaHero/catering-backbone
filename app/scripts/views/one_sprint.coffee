define [
  'jquery'
  'underscore'
  'backbone'
  'templates'

  'models/sprint'

  'views/panel'
], ($, _, Backbone, JST, SprintModel, PanelView) ->
  class OneSprintView extends Backbone.View
    template: JST['app/scripts/templates/one_sprint.hbs']

    el: '#container'

    panel: new PanelView()

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
      @panel.render()
      @panel.delegateEvents()


  return OneSprintView
     
