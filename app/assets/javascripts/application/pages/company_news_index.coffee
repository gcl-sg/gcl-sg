App.Page.on 'company_news_index', ->
  MODE = 'company_news_list_mode'

  setListMode = (mode) ->
    $listToolbar = $('.list-toolbar')
    $listToolbar.find('.toolbar-item').removeClass 'active'

    if mode is 'list-mode'
      $listToolbar.find('[data-mode="list-mode"]').addClass 'active'
      $('.article-cards').removeClass('grid-mode').addClass 'list-mode'
    else
      $listToolbar.find('[data-mode="grid-mode"]').addClass 'active'
      $('.article-cards').removeClass('list-mode').addClass 'grid-mode'

  return {
    ready: ->
      setListMode(store.get(MODE) || 'list-mode')

      $(document).on 'tap.company_news_index', '.list-toolbar .toolbar-item', ->
        $this = $ this
        mode = $this.data('mode')
        store.set(MODE, mode)
        setListMode(mode)
      
    destroy: ->
  }