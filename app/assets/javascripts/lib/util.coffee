window.App = window.App || {}
_ = window._

# 工具类,依赖jquery,lodash-core
App.util = {
  FORM_ELEMENTS: "input, textarea, select, button"

  # 取得上下文（jquery对象)，如果已经提供context，则将其包装成jquery对象，否则上下文设置为$(document.body)
  getContext: ($context) ->
    return if $context then $($context) else $(document.body)

  # 隐藏 $selector, 并将其里面的表单元素禁用
  hideAndDisable: ($selector)->
    $selector.hide().find(App.util.FORM_ELEMENTS).prop('disabled', true)
    $selector.filter(App.util.FORM_ELEMENTS).prop('disabled', true)

  # 显示 $selector, 并将其里面的表单元素启用
  showAndEnable: ($selector)->
    $selector.show().find(App.util.FORM_ELEMENTS).prop('disabled', false)
    $selector.filter(App.util.FORM_ELEMENTS).prop('disabled', false)

  # 访问链接
  visit: (url) ->
    if window.Turbolinks and Turbolinks.supported
      Turbolinks.visit url
    else
      location.href = url

  # html 转义
  htmlDecode:(str)->
    s = ""
    return "" if str.length is 0
    s = str.replace(/&amp;/g, "&")
    s = s.replace(/&lt;/g, "<")
    s = s.replace(/&gt;/g, ">")
    s = s.replace(/&nbsp;/g, " ")
    s = s.replace(/&#39;/g, "\'")
    s = s.replace(/&quot;/g, "\"")
    s = s.replace(/<br>/g, "\n")

  htmlEncode: (str)->
    s = ""
    return "" if str.length is 0
    s = str.replace(/&/g, "&amp;")
    s = s.replace(/</g, "&lt;")
    s = s.replace(/>/g, "&gt;")
    s = s.replace(/\'/g, "&#39;")
    s = s.replace(/\ /g, "&nbsp;")
    s = s.replace(/\"/g, "&quot;")
    s = s.replace(/\n/g, "<br>")

  # 基于bootstrap弹出层, modal必须有一个唯一id
  showModal: (modalHtml) ->
    $newModal = $(modalHtml)
    $oldModal = $("##{$newModal.attr('id')}")
    if $oldModal.length > 0
      $oldModal.html($newModal.html()).modal('show').modal('handleUpdate')
      return $oldModal
    else
      $newModal.modal('show')
      return $newModal

  # 基于bootstrap datetimepicker的时间控件初始化
  setupDatetimePicker: ($context) ->
    $context = @getContext($context)

    commonOptions = {
      locale: 'zh-cn'
    }

    datePickeroptions = {
      format: "YYYY-MM-DD"
    }

    datetimePickerOptions = {
      format: "YYYY-MM-DD HH:MM"
    }

    $('.date-picker', $context).each ->
      $this = $(this)
      $this.datetimepicker($.extend({}, commonOptions, datePickeroptions, $this.data()))
    $('.datetime-picker', $context).each ->
      $this = $(this)
      $this.datetimepicker($.extend({}, commonOptions, datetimePickerOptions, $this.data()))

  # 基于script.js的脚本加载器
  loadVideoJS: (readyCallback) ->
    if window.videojs
      readyCallback()
    else 
      $script(['/vendor/video-js/video.min.js', '/vendor/video-js/lang/zh-CN.js'], 'bundle')
      $script.ready('bundle', ->
        videojs.options.flash.swf = "/vendor/video-js/video-js.swf"
        readyCallback()
      )
    
}