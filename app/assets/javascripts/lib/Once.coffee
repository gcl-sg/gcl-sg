# 全局变量定义
window.App = window.App || {}

App.Once = ->

  ########### 全局页面事件绑定 #######################
  $(document).off('.global')
  .on 'click.global', ->
    $('.tiny-search').removeClass 'active'
  .on 'mouseenter.global', '.tiny-search', -> $(this).addClass 'active';
  .on 'click.global', '.tiny-search', -> false
  .on 'click.global', '.smart-header .menu-icon', -> $(document.body).addClass('open-nav')
  .on 'click.global', '.open-nav .layer', -> $(document.body).removeClass('open-nav')
  .on 'click.global', '.link-picker a', ->
    $this = $ this
    $this.parent().addClass('active').siblings().removeClass('active')
    $this.closest('.link-picker').find('.text').text $this.text()
    false
  .on 'click.global', '.links .btn-enter', ->
    $links = $(this).closest('.links').find('li')
    $link = $links.filter('.active')
    if $link.length == 0
      $link = $links.eq 0
    location.href = $link.find('a').attr('href')

  ########## 页面第一次加载完成后 ###################3
  $(window).on('load', ->)

App.Once()