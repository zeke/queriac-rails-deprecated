# For compatibility, use log() instead of console.log()
# http://zeke.tumblr.com/post/13617946104/improved-javascript-logging-function
window.log = ->
  console.log.apply console, arguments if window.console

$ ->

  $("a#delete_command").live "ajax:success", (event, data, status, xhr) ->
    command = JSON.parse(xhr.responseText)
    if command.keyword
      $("#command_" + command.id).slideUp()

  window.mirror = CodeMirror.fromTextArea(document.getElementById("command_script"), theme:"neat")