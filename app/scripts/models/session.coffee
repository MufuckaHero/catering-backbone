define [
  'jquery'
  'backbone'
  'router'
], ($, Backbone, Router) ->
  SessionModel = Backbone.Model.extend(
    url: '/sessions'

    initialize: ->
      self = this

      $.ajaxPrefilter( (options, originalOptions, jqXHR) ->

        if self.get('token')?
          jqXHR.setRequestHeader('X-Auth-Token', self.get('token'))
      )

    login: (params) ->
      self = this

      this.fetch(
        data: params,
        dataType: 'json',
        type: 'POST'
        success: (model, xhr, options) ->
          #console.log('Success')
          #console.log(model)
          sessionStorage.setItem('token', model.get('token'))
        error: (model, xhr, options) ->
          console.log('Error')
          console.log(options)
          console.log(xhr)
      )
      return

    logout: ->
      self = this
      _logout = $.ajax(
        url: @url
        type: 'DELETE'
        success:(res) ->
          self.clear()
          self.id = null
          sessionStorage.removeItem('token')
          console.log("success logout")
          console.log(res)
        error: (res) ->
          console.log("error in logout")
          console.log(res)
      )
      return

    getAuth: ->
      self = this
      if (sessionStorage.getItem('token'))
        token = sessionStorage.getItem('token')
        self.set({ auth: true, token: token})
  )
  new SessionModel