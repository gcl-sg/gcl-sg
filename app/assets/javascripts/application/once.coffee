_repositionSubMenu = ($menu)->
  menuOffsetLeft = $menu.offset().left
  menuWidth = $menu.width()
  subMenusWidth = 0
  $menu.find('li').each((i, item) -> subMenusWidth += $(item).width())
  offsetLeft = menuOffsetLeft + menuWidth / 2 - subMenusWidth / 2
  offsetLeft = Math.max(Math.min(offsetLeft, $menu.find('> ul').outerWidth() - subMenusWidth - 17), 0)

  $menu.find('> ul').css('padding-left', offsetLeft + 'px')

# 全局页面事件绑定
addGlobalEventHandlers = ->
  $(document).off('.global')
  .on 'tap.global', '.tiny-search', -> false
  .on 'tap.global', '.smart-header .menu-icon', -> $(document.body).addClass('open-nav'); false
  .on 'tap.global', '.open-nav .layer', -> $(document.body).removeClass('open-nav'); false
  .on 'swiperight.global', '.open-nav .header', -> $(document.body).removeClass('open-nav'); false
  .on 'tap.global', '.link-picker a', ->
    $this = $ this
    $this.parent().addClass('active').siblings().removeClass('active')
    $this.closest('.link-picker').find('.text').text $this.text()
    true

  .on 'mouseenter.global', '.main-nav nav li', ->
    $li = $(this)
    if $li.find('ul')[0]
      $li.addClass('hover')
      _repositionSubMenu($li)

  .on  'mouseleave.global', '.main-nav nav li', ->
    $(this).removeClass('hover')

# 页面第一次加载完成后
$(window).on('load', ->
  addGlobalEventHandlers()
)