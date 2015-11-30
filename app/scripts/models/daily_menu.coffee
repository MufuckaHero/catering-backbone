define [
  'jquery'
  'backbone'
  'router'
], ($, Backbone, Router) ->

  DailyMenu = Backbone.Model.extend(
    url: -> 
      '/sprints/' + @id

    initialize: (options) ->
      @id = options.id
  )
    
  return DailyMenu