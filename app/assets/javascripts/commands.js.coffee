window.log = ->
  console.log.apply console, arguments if window.console

$ ->

  $("a#delete_command").on "ajax:success", (event, data, status, xhr) ->
    command = JSON.parse(xhr.responseText)
    if command.keyword
      $("#command_" + command.id).slideUp()

  if document.getElementById("command_script")
    window.mirror = CodeMirror.fromTextArea(document.getElementById("command_script"), theme:"neat")