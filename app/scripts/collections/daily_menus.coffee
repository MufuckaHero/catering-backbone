define [
  'jquery'
  'underscore'
  'backbone'
  'router'
  'moment'

  'models/daily_menu'
], ($, _, Backbone, Router, moment, DailyMenuModel) ->
  DailyMenusCollection= Backbone.Collection.extend(
    url: 'http://localhost:3000/api/v1/daily_menus' 
    model: DailyMenuModel

    initialize: ->
      this.fetch(
        dataType: 'json',
        type: 'GET'
      ) 
  )

  return DailyMenusCollection
