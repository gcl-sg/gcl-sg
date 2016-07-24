window.App = window.App || {}

# 每个tuibolink请求完成都会执行一次
App.PageReady =
  # notice: all func in this object will be run once after turbolinks:render


  ready: ->
    self = @
    $(document).on 'turbolinks:load', ->
      func.apply(self) for own name, func of self when name isnt 'ready'

App.PageReady.ready()


