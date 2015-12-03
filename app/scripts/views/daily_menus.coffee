define [
  'jquery'
  'underscore'
  'backbone'
  'templates'

  'collections/daily_menus'

], ($, _, Backbone, JST, DailyMenusCollection) ->
  class DailyMenusView extends Backbone.View
    template: JST['app/scripts/templates/daily_menus.hbs']

    el: '#container'

    events: {
      'click .btn-group btn-group-justified': 'changeTab'
    }

    initialize: () ->
      # @listenTo @model, 'change', @render
      @daily_menus = new DailyMenusCollection
      
      this.daily_menus.on('sync', this.render, this);  

    render: () ->
      @$el.html @template(
        daily_menus: @daily_menus.toJSON()
      )


  return DailyMenusView
     