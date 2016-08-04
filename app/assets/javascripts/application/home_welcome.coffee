App.Page.on 'home_welcome', ->
  
  addEventListener = ->
    $ document
    .on 'click.home_welcome', '.full-carousel .indicator li:not(.active-indicator)', ->
      $context = $(this).closest('.full-carousel')
      index = $context.find('.indicator li').index(this)
      $context.find('.carousel-items li').removeClass('active').eq(index).addClass('active')
      $context.find('.active-indicator').css('left', index * 97);

  setTick = ->
    return setInterval(->
      $items = $('.carousel-items li')
      index = $items.index($items.filter('.active'))
      if index == -1 or index is $items.length - 1
        nextIndex = 0
      else
        nextIndex = index + 1

      $('.indicator li').eq(nextIndex).trigger('click')
    , 5000)

  return {
    ready: ->
      addEventListener()
      timer = setTick()
      
    destroy: ->
      $(document).off('.home_welcome')
      clearInterval(timer)
  }