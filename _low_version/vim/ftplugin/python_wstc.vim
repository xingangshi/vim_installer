" Vim filetype plugin file
" Language:	python
" Maintainer:	Wang Linggui <wanglinggui@gmail.com>
" Description: Py function complete, this need vim compiled with +python
" Filepath: $HOME/.vim/ftplugin

if !exists('python') | finish | endif
if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1


if exists('g:loaded_python_wstc')
  finish
endif

let g:loaded_python_wstc = 1

function s:ShowPyFuncArgs()
python << EOF
import vim
import os
import re
import traceback

def FormatStack(traceback_element):
  '[filename:lineno]:'
  return "[" + traceback_element[0] + ":" + str(traceback_element[1]) + "]:"

def GetTopTraceback():
  '''
   获取调用堆栈的最顶层
  '''
  tb_list = traceback.extract_stack()
  if len(tb_list) == 0:
    return ""
  if len(tb_list) == 1:
    return FormatStack(tb_list[0])
  return FormatStack(tb_list[len(tb_list) - 3])

def Log(string):
  print GetTopTraceback() + string

def GetFunctionDef(filepath, funcname):
  'GetFunctionDef'
  if not os.path.isfile(filepath):
    Log('[%s] not exists' % filepath)
    return
  lines = open(filepath).readlines()
  expr = '^[ ]*def[ ]+%s[ ]*\(.*' % funcname
  matcher = re.compile(expr)
  buffer = []
  for line in lines:
    if len(buffer):
      buffer.append(line)
    elif matcher.match(line):
      buffer.append(line)
    if len(buffer) and line.find(':') != -1:
      break
  if not buffer:
    Log('Not Find %s in [%s]' % (funcname, filepath))
    return
  ret = ''
  for line in buffer:
    ret += line.replace('\n', '').replace('\\', '')
  len_ret = 0
  while len_ret != len(ret):
    len_ret = len(ret)
    ret = ret.replace('  ', ' ')
  return ret

def GetPyLine(filepath, lineno):
  '获得整个有效行'
  if not os.path.isfile(filepath):
    Log('[%s] not exists' % filepath)
    return
  lines = open(filepath).readlines()
  linebeg = lineno - 1
  while linebeg > 0:
    linepre = lines[linebeg - 1].replace('\n', '').replace('\r', '')
    if not linepre.endswith('\\'):
      break
    linebeg -= 1
  content = ''
  for ln in range(linebeg, lineno):
    content += lines[ln].lstrip().replace('\\', '').replace('\n', '')
  return content

def find():
  filepath = os.path.abspath(vim.current.buffer.name)
  if filepath.find('platform/sanguo') == -1:
    Debug('Do not support !sanguo')
    return
  line = vim.current.line
  current_line_number = vim.current.window.cursor[0]
  pyline = GetPyLine(filepath, current_line_number)
  if pyline.find('(') == -1:
    Log('Not Find "(" in [%s]' % pyline)
    return
  line = pyline[ : pyline.rfind('(')]
  dot = line.rfind('.')
  find_file = filepath
  if dot != -1:
    find_file = line[:dot].strip().replace('.', '/') + '.py'
    find_file = find_file[find_file.find('sanguo'):]
    find_file = filepath[:filepath.find('sanguo')] + find_file
    function_name = line[dot+1:].strip()
  else:
    function_name = line.strip()
  ret = GetFunctionDef(find_file, function_name)
  if None == ret:
    return
  ret = '##@@  ' + ret
  vim.current.buffer.append(ret, current_line_number) 
find()
EOF
endfunction

inoremap <unique> <F4> <ESC>:w<CR><ESC>:call <SID>ShowPyFuncArgs()<CR> 
noremap <unique> <F4> <ESC>:w<CR><ESC>:call <SID>ShowPyFuncArgs()<CR>

