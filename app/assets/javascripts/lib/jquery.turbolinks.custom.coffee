###
jQuery.Turbolinks ~ https://github.com/kossnocorp/jquery.turbolinks
jQuery plugin for drop-in fix binded events problem caused by Turbolinks

The MIT License
Copyright (c) 2012-2013 Sasha Koss & Rico Sta. Cruz
###

# custom jQuery.Turbolinks to support turbolinks 5.x
$ = window.jQuery or require?('jquery')
$document = $(document)

$.turbo =
  version: '2.1.0'

  isReady: false

# Hook onto the events that Turbolinks triggers.
  use: (load, fetch) ->
    $document
    .off('.turbo')
    .on("#{load}.turbo", @onLoad)
    .on("#{fetch}.turbo", @onFetch)

  addCallback: (callback) ->
    if $.turbo.isReady
      callback($)
    $document.on 'turbo:ready', -> callback($)

  onLoad: ->
    $.turbo.isReady = true
    $document.trigger('turbo:ready')

  onFetch: ->
    $.turbo.isReady = false

# Registers jQuery.Turbolinks by monkey-patching jQuery's
# `ready` handler. (Internal)
#
# Override `$(function)` and `$(document).ready(function)` by
# registering callbacks under a new event called `turbo:ready`.
#
  register: ->
    $.fn.ready = @addCallback #[2]

# Use with Turbolinks.
if window.Turbolinks and window.Turbolinks.supported
  $.turbo.register()
  $.turbo.use('turbolinks:load', 'turbolinks:request-start')