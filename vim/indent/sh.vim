" Vim indent file
" Language:	    Shell Script
" Maintainer:       Nikolai Weibull <now@bitwi.se>
" Latest Revision:  2006-04-19

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetShIndent()
setlocal indentkeys+==then,=do,=else,=elif,=esac,=fi,=fin,=fil,=done
setlocal indentkeys-=:,0#

if exists("*GetShIndent")
  finish
endif

setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab

let s:cpo_save = &cpo
set cpo&vim

function GetShIndent()
  let lnum = prevnonblank(v:lnum - 1)
  if lnum == 0
    return 0
  endif

  " Add a 'shiftwidth' after if, while, else, case, until, for, function()
  " Skip if the line also contains the closure for the above
  let ind = indent(lnum)
  let line = getline(lnum)
  let s:sw = 2
  if line =~ '^\s*\(if\|then\|do\|else\|elif\|case\|while\|until\|for\)\>'
	\ || line =~ '^\s*\<\k\+\>\s*()\s*{'
	\ || line =~ '^\s*{'
    if line !~ '\(esac\|fi\|done\)\>\s*$' && line !~ '}\s*$'
      let ind = ind + s:sw
    endif
  endif

  " Subtract a 'shiftwidth' on a then, do, else, esac, fi, done
  " Retain the indentation level if line matches fin (for find)
  let line = getline(v:lnum)
  if (line =~ '^\s*\(then\|do\|else\|elif\|esac\|fi\|done\)\>' || line =~ '^\s*}')
	\ && line !~ '^\s*fi[ln]\>'
    let ind = ind - s:sw
  endif

  return ind
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
