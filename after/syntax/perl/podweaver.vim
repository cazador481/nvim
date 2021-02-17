" syn match podCommand "^=attr" nextgroup=podCmdText contains=@NoSpell
" syn match podCommand "^=method" nextgroup=podCmdText contains=@NoSpell
" syn match podCommand "^=ClassType" nextgroup=podCmdText contains=@NoSpell
" syn match podCommand "^=OtherType" nextgroup=podCmdText contains=@NoSpell
" syn cluster Pod add=podCommand
