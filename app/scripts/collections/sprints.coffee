define [
  'jquery'
  'underscore'
  'backbone'
  'router'
  'moment'

  'models/sprint'
], ($, _, Backbone, Router, moment, SprintModel) ->
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
