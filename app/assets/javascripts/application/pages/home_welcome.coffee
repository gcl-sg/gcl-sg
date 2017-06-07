App.Page.on 'home_welcome', ->

  timer = 0
  addEventListener = ->
    $ document
    .on 'tap.home_welcome', '.full-carousel .indicator li:not(.active-indicator)', ->
      # reset timer
      clearInterval(timer)
      timer = setTick()

      $context = $(this).closest('.full-carousel')
      $items = $context.find('.carousel-items li')
      index = $context.find('.indicator li').index(this)
      $currentActiveItem = $items.eq(index)
      $prevActiveItem = $items.filter(->
        this != $currentActiveItem[0] && $(this).is('.active')
      )

      $items.each ->
        $this = $ this
        if (this isnt $prevActiveItem[0] and this isnt $currentActiveItem[0])
          clearTimeout($this.data('timer'))
          $this.removeClass('out active')

      $prevActiveItem.addClass('out')
      $prevActiveItem.data('timer', setTimeout(->
        $prevActiveItem.removeClass('out active')
      , 1000))

      clearTimeout($currentActiveItem.data('timer'))
      $currentActiveItem.removeClass('out').addClass('active')

      $context.find('.active-indicator').css('left', index * 84);


  setTick = ->
    return setInterval(->
      $items = $('.carousel-items li')
      index = $items.index($items.filter('.active'))
      nextIndex = 0
      if index == -1 or index is $items.length - 1
        nextIndex = 0
      else
        nextIndex = index + 1

      $('.indicator li').eq(nextIndex).trigger('tap')
    , 7000)

  init = ->
    $('.carousel-items li').eq(0).addClass('active')

  return {
    ready: ->
      init()
      addEventListener()
      timer = setTick()
      
    destroy: ->
      $(document).off('.home_welcome')
      clearInterval(timer)
  }