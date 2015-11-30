define [
  'jquery'
  'underscore'
  'backbone'
  'router'

  'models/sprint'
], ($, _, Backbone, Router, SprintModel) ->
  SprintsCollection = Backbone.Collection.extend(
    url: -> 
      '/sprints' 
    model: SprintModel

    initialize: ->
      this.fetch(
        dataType: 'json',
        type: 'GET',
        reset: true 
      ) 
  )

  return SprintsCollection
