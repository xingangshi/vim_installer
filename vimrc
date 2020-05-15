
set nonu
set background=dark
syntax on

" switch windows
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

set backspace=indent,eol,start
" Taglist
let Tlist_Auto_Update=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=27
let Tlist_Show_One_File=1

"omnicppcomplete
set nocp
filetype plugin on
let g:OmniCpp_GlobalScopeSearch = 1
let g:OmniCpp_NamespaceSearch = 1

"color
color molokai
"set t_Co=256

"ctags
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q  .<CR> <Esc>:set tags+=./tags <CR>

filetype indent on
"set path+=/usr/include
set listchars=tab:>-,trail:%
set list
"paste module
set pastetoggle=<F11>
set tabstop=2

set encoding=utf-8

set laststatus=2

"第80行之后高亮显示
hi LineTooLong ctermfg=223
au BufWinEnter *.py,*.h,*.cc let w:m1=matchadd('Search', '\%>79v', -1)
au BufWinEnter *.py,*.h,*.cc let w:m2=matchadd('LineTooLong', '\%>79v.\+', -1)
au BufWinEnter *.py,*.h,*.cc let w:m2=matchadd('LineTooLong', '^ +$', -1)

" highlight search
set hlsearch

" py highlight
let python_highlight_builtins = 1
let python_highlight_builtin_objs = 1
let python_highlight_exceptions = 1
let python_highlight_string_formatting = 1
let python_highlight_string_format = 1
let python_highlight_string_templates = 1
let python_highlight_indent_errors = 1
let python_highlight_space_errors = 1
let python_highlight_doctests = 1
let python_highlight_all = 1
let python_print_as_function = 1

autocmd FileType python set omnifunc=pythoncomplete#Complete

augroup filetype
au! BufRead,BufNewFile *.proto set filetype=proto
au! BufRead,BufNewFile *.txt,*.INFO,*.ERROR,*.WARNING set filetype=python
au! BufRead,BufNewFile SConstruct,SConscript set filetype=python
augroup end

noremap <F2> <ESC>:TlistToggle<CR>
inoremap <C-F2> <ESC>:TlistToggle<CR>
"NERD_tree
noremap <F3> <ESC>:NERDTreeToggle<CR>
inoremap <F3> <ESC>:NERDTreeToggle<CR>
"switch h, cc
noremap <leader>av :AV<CR>

set ic
set incsearch
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"自动加载~/tags下的文件
execute "set tags+=" . system("ls -l ~/tags/ | grep -v ^total | awk 'BEGIN{a=\"\"}{if (a != \"\") a = a \",\"; a=a \"~/tags/\" $NF} END{print a}'")

" https://agentzh.org/misc/.vimrc
