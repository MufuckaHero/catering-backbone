define [
  'jquery'
  'underscore'
  'backbone'
  'templates'

  'collections/sprints'
  'models/sprint'

  'views/panel'
  'views/one_sprint'
], ($, _, Backbone, JST, SprintsCollection, SprintModel, PanelView, OneSprintView) ->
  class SprintsView extends Backbone.View
    template: JST['app/scripts/templates/sprints.hbs']

    el: '#container'

    panel: new PanelView()

    events: {}

    initialize: () ->
      # @listenTo @model, 'change', @render
      @sprint = new SprintsCollection
      
      this.sprint.on('sync', this.render, this);  

    render: () ->
      @$el.html @template(
        sprint: @sprint.toJSON()
      )
     
      @panel.$el = @$('#user_panel')
      @panel.render()
      @panel.delegateEvents()

  return SprintsView
     
