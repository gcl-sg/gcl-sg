window.App = window.App || {}

EVENTS_TYPE = {
  PAGE_READY: 'turbolinks:load',
  PAGE_UNLOAD: 'turbolinks:before-cache',
}

# 页面驱动，一个页面对应一个或多个页面对象，该页面对象会在相应的页面加载完毕或者卸载时执行ready或destroy接口。
App.Page = (->
  # private
  pagesContainer = {}

  currentPageName = ->
    return $("body").data('page')

  getCurrentPageObjects = ->
    return pagesContainer[currentPageName()]

  getPageObjects = (pageName) ->
    return pagesContainer[pageName]

  isOnCurrentPage = (pageName)->
    return $(document.body).is("[data-page='#{pageName}']")

  pageStart = (pageName)->
    pageObjects = getPageObjects(pageName)

    # 如果页面对象是一个对象，则检查其ready接口并执行，如果是函数，则执行该函数取得其返回值作为真实的页面对象，然后检查其ready接口并执行
    runAndReady = (pageObject, index)->
      if typeof pageObject is 'object'
        pageObject.ready() if typeof pageObject.ready is 'function'
      else if typeof pageObject is 'function'
        instance = pageObject()
        pageObjects[index] = instance
        instance.ready() if instance and typeof instance.ready is 'function'

    if pageObjects
      runAndReady(pageObject, index) for pageObject, index in pageObjects

  # public
  return {
    # 定义页面对象
    # pageNames: 字符串或数组，页面名（body上的data-page属性），多个页面使用相同的页面对象时，可以用逗号分割页面名，或者使用数组来装载页面名
    # pageObject：对象或者函数，需要提供ready和destroy接口，（如果是函数，则需要返回带ready和destroy接口的对象，不建议使用函数，将来考虑删除）
    on: (pageNames, pageObject) ->
      unless pageNames instanceof Array
        pageNames = pageNames.split(',')

      for pageName in pageNames
        do (pageName) ->
          pageName = $.trim(pageName)
          pageObjects = pagesContainer[pageName]
          if pageObjects then pageObjects.push(pageObject) else pagesContainer[pageName] = [pageObject]
      @

    # 启动页面监听，页面加载完毕是开始调用相应页面的页面对象的ready函数，页面卸载时则调用destroy函数
    ready: ->
      $(document).on EVENTS_TYPE.PAGE_READY, (e)->
        pageStart(currentPageName());

      $(document).on EVENTS_TYPE.PAGE_UNLOAD, ->
        pageObjects = getCurrentPageObjects()
        if pageObjects
          pageObject.destroy() for pageObject in pageObjects when typeof pageObject.destroy is 'function'

    # todo: for debug, should remove all the interfaces below at last
    getPageContainer: ->
      return pagesContainer;
  }
)()

App.Page.ready()