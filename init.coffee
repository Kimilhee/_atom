# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

# script 실행시 node 패스 못찾는 문제 수정용.
# https://github.com/atom-community/linter/issues/726 에서 rldona 란 사람이 올려놓은 Tip이었음.
# process.env.PATH = ["/usr/local/bin", process.env.PATH].join(":")
# 현재 Atom 1.20.0/script v3.15.0에서는 잘 돌아서 막아둠.)

# 주주주주주주주주주주주주주주주주주주주주주주주주주주주주주주주주주주주주
# 이 파일은 수정후 즉시 반영되지 않음. Atom reload(Ctrl+Alt+Cmd+L) 해야 적용됨.
# 주주주주주주주주주주주주주주주주주주주주주주주주주주주주주주주주주주주주

# 현재 커서의 단어를 클립보드에 복사.
atom.commands.add 'atom-text-editor', 'hee:my-copy', ->
  editor = atom.workspace.getActiveTextEditor()
  editor.selectWordsContainingCursors()
  editor.copySelectedText()
  editor.getLastCursor().clearSelection()
  editor.moveToBeginningOfWord()

# 현재 커서의 단어를 클립보드내용으로 대체.
atom.commands.add 'atom-text-editor', 'hee:my-paste', ->
  editor = atom.workspace.getActiveTextEditor()
  editor.selectWordsContainingCursors()
  editor.pasteText()

#atom.commands.add 'atom-text-editor', 'hee:goto-declaration', (event)->
#  # 커서가 함수이름 맨앞에 있을 때는 go-to-declaration이 안먹어서 커서위치를 좀 이동함.
#  editor = atom.workspace.getActiveTextEditor()
#  editor.moveRight()
#  editor.moveToBeginningOfWord()
#  editor.moveRight()
#  atom.commands.dispatch(event.target, 'atom-ctags:go-to-declaration')

# command mode에서 맨 마지막에 semicolon 넣기.
atom.commands.add 'atom-text-editor', 'custom:semicolonize', (event)->
  editor = atom.workspace.getActiveTextEditor()
  editor.moveToEndOfLine()
  atom.commands.dispatch(event.target, 'vim-mode:insert-after')
  editor.insertText(";")
  atom.commands.dispatch(event.target, 'vim-mode:activate-normal-mode')

# 현재 커서에 공백 하나 넣기.
atom.commands.add 'atom-text-editor', 'hee:my-space', ->
  editor = atom.workspace.getActiveTextEditor()
  editor.insertText(" ")

# 현재 커서 다음 줄에 한 줄 넣기.
atom.commands.add 'atom-text-editor', 'hee:nospace-new-line', ->
  editor = atom.workspace.getActiveTextEditor()
  editor.insertNewlineBelow();
  editor.deleteToBeginningOfLine()

# emitter test (에러가 나고 잘 안됨 --; 방법을 찾아야 함!)
# atom.commands.add 'atom-text-editor', 'hee:my-emitter', ->
#     atom.commands.dispatch 'atom-text-editor', 'vim-mode:move-left'
#     atom.commands.dispatch 'atom-text-editor', 'vim-mode:move-down'
