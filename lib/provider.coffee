path = require 'path'

module.exports = provideBuilder: -> class
  getNiceName: -> 'Dockerfile'

  isEligible: ->
    if atom.getVersion().startsWith '1.7.'
      return true
    editor = atom.workspace.getActiveTextEditor()
    if !editor or !editor.getPath()
      return false
    path.basename editor.getPath()
      .startsWith 'Dockerfile'

  settings: ->
    [
      name: 'Dockerfile: build',
      sh: false,
      exec: 'docker',
      args: [ 'build', '-f', '{FILE_ACTIVE}', '{FILE_ACTIVE_PATH}' ]
    ]
