# 每个tuibolink请求完成都会执行一次
({
# notice: all func in this object will be run once after turbolinks:load

  ready: ->
    runAllFuncs = =>
      func.apply(@) for own funcName, func of @ when funcName isnt 'ready'
      
    if window.Turbolinks && window.Turbolinks.supported
      $(document).on 'turbolinks:load', runAllFuncs
    else 
      $(runAllFuncs)  

}).ready()
