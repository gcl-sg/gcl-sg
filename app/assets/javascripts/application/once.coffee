
# 全局页面事件绑定
addGlobalEventHandlers = ->
  $(document).off('.global')
  .on 'tap.global', ->
    $('.tiny-search').removeClass 'active'
  .on 'mouseenter.global', '.tiny-search', -> $(this).addClass 'active'; false
  .on 'tap.global', '.tiny-search', -> false
  .on 'tap.global', '.smart-header .menu-icon', -> $(document.body).addClass('open-nav'); false
  .on 'tap.global', '.open-nav .layer', -> $(document.body).removeClass('open-nav'); false
  .on 'swiperight.global', '.open-nav .header', -> $(document.body).removeClass('open-nav'); false
  .on 'tap.global', '.link-picker a', ->
    $this = $ this
    $this.parent().addClass('active').siblings().removeClass('active')
    $this.closest('.link-picker').find('.text').text $this.text()
    false
  .on 'tap.global', '.links .btn-enter', ->
    $links = $(this).closest('.links').find('li')
    $link = $links.filter('.active')
    if $link.length == 0
      $link = $links.eq 0
    location.href = $link.find('a').attr('href')
    false

# 页面第一次加载完成后
$(window).on('load', ->
  addGlobalEventHandlers()
)