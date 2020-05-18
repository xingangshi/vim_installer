set nocompatible               "去除VIM一致性，必须"
filetype off                   "必须"

"设置包括vundle和初始化相关的运行时路径"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"启用vundle管理插件，必须"
Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe',{'do':'python3 install.py --all'}

"在此增加其他插件，安装的插件需要放在vundle#begin和vundle#end之间"
"安装github上的插件格式为 Plugin '用户名/插件仓库名'"

"Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'grep.vim'
Plugin 'taglist.vim'

call vundle#end()            " required
filetype plugin indent on      "加载vim自带和插件相应的语法和文件类型相关脚本，必须"

let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

set nonu
set background=dark
syntax on

nnoremap <silent> <F3> :Grep<CR>

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


"自动补全配置
set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme 默认tab s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1 " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR> "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR> "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处

let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1 "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28 "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1 "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1 "在右侧窗口中显示taglist窗口
let Tlist_Use_Left_Windo =1 "在左侧窗口中显示taglist窗口
