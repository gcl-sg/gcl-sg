# 全局变量定义
window.App = window.App || {}

App.Once = ->

  ########### 全局页面事件绑定 #######################
  $(document).off('.global')

  ########## 页面第一次加载完成后 ###################3
  $(window).on('load', ->)

App.Once()