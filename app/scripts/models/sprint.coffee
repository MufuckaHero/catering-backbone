define [
  'jquery'
  'backbone'
  'router'
], ($, Backbone, Router) ->

  SprintModel = Backbone.Model.extend(
    url: -> 
      '/sprints/' + @id

    initialize: (options) ->
      @id = options.id
  )
    
  return SprintModel