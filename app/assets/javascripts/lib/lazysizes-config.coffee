window.lazySizesConfig = window.lazySizesConfig || {}
window.lazySizesConfig.lazyClass = 'lazy'
lazySizesConfig.srcAttr = 'data-lazy'
lazySizesConfig.loadMode = 1

_addLazyloadSupportedFor = ($context) ->
  $context.find('img:not(.lazy, .lazyloaded)').each ->
    src = this.src
    this.src = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC'
    $ this
    .addClass 'lazy'
    .attr({'data-lazy': src})


$(document).on 'turbolinks:load', (e)->
  _addLazyloadSupportedFor($('.article'))