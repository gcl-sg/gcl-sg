App.Page.on 'company_news_index', ->
  return {
    ready: ->
      $(document).on 'tap.company_news_index', '.list-toolbar .toolbar-item', ->
        $this = $ this
        mode = $this.data('mode')

        $this.addClass('active').siblings().removeClass('active')
        if mode is 'list-mode'
          $('.article-cards').removeClass('grid-mode').addClass('list-mode')
        else
          $('.article-cards').removeClass('list-mode').addClass('grid-mode')
      
    destroy: ->
  }