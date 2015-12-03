define [
  'jquery'
  'backbone'
  'router'
], ($, Backbone, Router) ->

  DailyMenuModel = Backbone.Model.extend(
    url: '/daily_menus' 
 
    initialize: ->
     
  )
    
  return DailyMenuModel