App.Page.on 'home_welcome', ->

  timer = 0
  addEventListener = ->
    $ document
    .on 'click.home_welcome', '.full-carousel .indicator li:not(.active-indicator)', ->
      # reset timer
#      clearInterval(timer)
#      timer = setTick()

      $context = $(this).closest('.full-carousel')
      $items = $context.find('.carousel-items li')
      index = $context.find('.indicator li').index(this)
      $prevActiveItem = $items.filter('.active')
      if $prevActiveItem.length > 0
        clearTimeout($prevActiveItem.data('timer'))
        $prevActiveItem.removeClass('out')
      $prevActiveItem.addClass('out')
      $prevActiveItem.data('timer', setTimeout(->
        $prevActiveItem.removeClass('out active')
      , 1000))
      $items.eq(index).addClass('active')
      $context.find('.active-indicator').css('left', index * 97);


  setTick = ->
    return setInterval(->
      $items = $('.carousel-items li')
      index = $items.index($items.filter('.active'))
      nextIndex = 0
      if index == -1 or index is $items.length - 1
        nextIndex = 0
      else
        nextIndex = index + 1

      $('.indicator li').eq(nextIndex).trigger('click')
    , 5000)

  init = ->
    $('.carousel-items li').eq(0).addClass('active')

  return {
    ready: ->
      init()
      addEventListener()
#      timer = setTick()
      
    destroy: ->
      $(document).off('.home_welcome')
      clearInterval(timer)
  }