# 全局变量定义
window.App = window.App || {}

App.Once = ->

  ########### 全局页面事件绑定 #######################
  $(document).off('.global')
  .on 'click.global', -> $('.tiny-search').removeClass 'active'
  .on 'mouseenter.global', '.tiny-search', -> $(this).addClass 'active'; console.log 'hover'
  .on 'click.global', '.tiny-search', -> false

  ########## 页面第一次加载完成后 ###################3
  $(window).on('load', ->)

App.Once()