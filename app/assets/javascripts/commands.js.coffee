# For compatibility, use log() instead of console.log()
# http://zeke.tumblr.com/post/13617946104/improved-javascript-logging-function
window.log = ->
  console.log.apply console, arguments if window.console

$ ->

  $("a#delete_command").live "ajax:success", (event, data, status, xhr) ->
    command = JSON.parse(xhr.responseText)
    if command.keyword
      $("#command_" + command.id).slideUp()
      # new_heading_html = $("h1").html().replace(/(\d+)/, (wholeMatch, count) ->
      #   parseInt(count, 10) - 1
      # )
      # $("h1").html new_heading_html
    else
      log "Problem deleting command:", command
      

  window.editor = ace.edit("editor")
  editor.setTheme "ace/theme/textmate"
  JavaScriptMode = require("ace/mode/javascript").Mode
  editor.getSession().setMode new JavaScriptMode()

  # Config
  editor.renderer.setShowGutter false
  editor.setShowInvisibles false
  editor.setHighlightActiveLine(false)
  editor.setFontSize "14px"
  editor.renderer.setShowPrintMargin(false)

  # Integrate with textarea
  window.textarea = $("#command_script").hide()
  
  editor.getSession().setValue textarea.val()
  editor.getSession().on "change", ->
    textarea.val editor.getSession().getValue()
