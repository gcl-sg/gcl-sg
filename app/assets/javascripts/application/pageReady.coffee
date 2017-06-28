# 每个tuibolink请求完成都会执行一次

isTurbolinksSupported = window.Turbolinks && window.Turbolinks.supported

_setArticleCardsMode = (mode) ->
  $listToolbar = $('.list-toolbar')
  $listToolbar.find('.toolbar-item').removeClass 'active'

  if mode is 'list-mode'
    $listToolbar.find('[data-mode="list-mode"]').addClass 'active'
    $('.article-cards').removeClass('grid-mode').addClass 'list-mode'
  else
    $listToolbar.find('[data-mode="grid-mode"]').addClass 'active'
    $('.article-cards').removeClass('list-mode').addClass 'grid-mode'

# ready
({
# notice: all func in this object will be run once after turbolinks:load
  initSlick: ->
    $('.slick').slick({
      lazyLoad: 'ondemand'
      slidesToScroll: 1
    })
    
  restoreArticleCardsMode: ->
    MODE  = 'article_cards_mode'
    $list = $('.article-cards')
    if $list[0]
      _setArticleCardsMode(store.get(MODE) || 'list-mode')
      $('.list-toolbar .toolbar-item').on('tap', ->
        $this = $ this
        mode = $this.data('mode')
        store.set(MODE, mode)
        _setArticleCardsMode(mode)
      )

  adjustFooterLinks: ->
    exLinks = $('.extra-links dl').toArray()
    if exLinks.length > 0
      $lastGroup = $('.footer-links .group:last')
      cutItems = 3 - $lastGroup.find('dl').length
      if cutItems > 0
        cutLinks = exLinks.splice 0, cutItems
        $lastGroup.append cutLinks

      exGroup = []
      $.each exLinks, (i, item)->
        if exGroup.length is 0 or exGroup[exGroup.length - 1].length >= 3
          exGroup.push []
        exGroup[exGroup.length - 1].push(item)
      $('.footer-links').append $.map(exGroup, (group) -> $('<div class="group"></div>').append(group))

    $('.footer-links .group').each (i, group) ->
      if i%2 is 0 && i isnt 0
        $('<div class="clearfix"></div>').insertBefore $(group)
    
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
      $(document).on 'turbolinks:request-end', ->
        func.apply(self) for own name, func of self when name isnt 'listening'

}).listening()

