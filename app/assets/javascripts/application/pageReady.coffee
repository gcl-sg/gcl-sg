# 每个tuibolink请求完成都会执行一次

isTurbolinksSupported = window.Turbolinks && window.Turbolinks.supported

# ready
({
# notice: all func in this object will be run once after turbolinks:load
  initSlick: ->
    $('.slick').slick({
      lazyLoad: 'ondemand'
      slidesToScroll: 1
      prevArrow: '<a class="slick-prev"></a>'
      nextArrow: '<a class="slick-next"></a>'
    })

  ready: ->
    runAllFuncs = =>
      func.apply(@) for own funcName, func of @ when funcName isnt 'ready'
      
    if isTurbolinksSupported
      $(document).on 'turbolinks:load', runAllFuncs
    else 
      $(runAllFuncs)  

}).ready()

# destroy
({
  destroySlick: ->
    $('.slick').slick('unslick').off('.global');
  listening: ->
    self = @
    if isTurbolinksSupported
      $(document).on 'turbolinks:before-render', ->
        func.apply(self) for own name, func of self when name isnt 'listening'

}).listening()

