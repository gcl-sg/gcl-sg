App.Page.on 'videos_show', ->

  player = null
  initPlayer = ->
    App.util.loadVideoJS ->
      player = videojs('video', {
        language: 'zh-CN',
        preload: 'metadata'
      })

  return {
    ready: ->
      initPlayer()

    destroy: ->
      player && player.dispose()
  }