"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PluginManager vim-plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
"call plug#begin()
Plug 'preservim/NERDTree'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/vim-scripts/taglist.vim'
Plug 'https://github.com/majutsushi/tagbar'
" Need to 'sudo apt-get install ctags'
Plug 'https://github.com/vim-scripts/TaskList.vim'
" sudo apt-get install cscope, make cscope ARCH=arm in linux code src to build
" database, or cscope -b in the root dir
Plug 'https://github.com/vim-scripts/cscope.vim'
Plug 'https://github.com/vim-scripts/ctags.vim--Johnson'
Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/mattn/emmet-vim'
" Code check, syntastic or ale , need to config
" Plug 'https://github.com/vim-syntastic/syntastic'
Plug 'dense-analysis/ale'

Plug 'https://github.com/preservim/nerdcommenter'
Plug 'https://github.com/sjl/gundo.vim'
Plug 'https://github.com/python-mode/python-mode'
Plug 'https://github.com/godlygeek/tabular'
Plug 'https://github.com/easymotion/vim-easymotion'
Plug 'https://github.com/vim-scripts/SrcExpl'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'https://github.com/skywind3000/asyncrun.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'
Plug 'tpope/vim-eunuch'
Plug 'mbbill/echofunc '
"FZF
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/bat'
" YCM
" Required vim 8.1+, or 'sudo apt install vim-youcompleteme'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
Plug 'adah1972/ycmconf'
" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdcommenter'

" Markdown
" This plugin will fold the content
Plug 'plasticboy/vim-markdown'
Plug 'ftplugin/markdown.vim'
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Python
Plug 'python-mode/python-mode'

Plug 'yegappan/mru' " Recently Used of gvim ui

Plug 'frazrepo/vim-rainbow'
Plug 'qpkorr/vim-renamer' 
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/LargeFile'
" :CalendarH , caL ; :Calendar, cal
Plug 'mattn/calendar-vim'
" Plug 'uguu-org/vim-matrix-screensaver'
" Plug 'vim/killersheep'

" For csv files
Plug 'mechatroner/rainbow_csv'
Plug 'mgodlygeek/tabular'

call plug#end()


" env setting
" fzf,ripgrep
" export FZF_DEFAULT_COMMAND='rg --files --sortr modified'



" For nerdcommenter
if !has('gui_running')
	  let g:NERDMenuMode = 0
endif

" Import Syntax and search highlight, command history, last space ...
source $VIMRUNTIME/vimrc_example.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Common setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Swith to the opened window when the file is already opened.
if v:version >= 800
	packadd! editexisting
endif

set autowrite " autosave when switching file
set nobackup
set undodir=~/.vim/undodir
if !isdirectory(&undodir)
	call mkdir(&undodir,'p',0700)
endif

" Support mouse
if has('mouse')
	if has('gui_running')
		set mouse=a
	else
		set mouse=nvi
	endif
endif

" default font size
if has('gui_running')
	"set guifont=monaco:h8
	"set guifont=monospace:h8
	set guifont=dejavu\ sans\ mono\ 10
	set guifontwide=noto\ sans\ mono\ cjk\ sc\ 11
	" set guifont=monospace \11
	
	" do not delay loading menu
	let do_syntax_sel_menu = 1
	let do_no_lazyload_menus = 1
endif


set scrolloff=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" my preference
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
"set highlightsearch
set hls
set cursorline
"set ruler
"set magic
"set tabstop=4 " set tab's width to 4
"set expandtab " replace tab with space
"set shiftwidth=4 " set indentation to 4
au filetype c,cpp,objc  setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4 cinoptions=:0,g0,(0,w1
au filetype json        setlocal expandtab shiftwidth=2 softtabstop=2
au filetype vim         setlocal expandtab shiftwidth=2 softtabstop=2
"set noexpandtab  " do not replace tab with space
" highlight current line
"au winleave * set nocursorline nocursorcolumn
"au winenter * set cursorline cursorcolumn
"set cursorline cursorcolumn
"
" 0 means no limit
au filetype changelog  setlocal textwidth=76

setlocal spell spelllang=en_us
set spelllang+=cjk
" support mouse right click menu.
set mousemodel=popup_setpos


" pust cscope cmd results in quickfix
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key remapping
" nnorempa - normal mode, inoremap - insert mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <c-tab>   <c-w>w
inoremap <c-tab>   <c-o><c-w>w
nnoremap <c-s-tab> <c-w>w
inoremap <c-s-tab> <c-o><c-w>w  
" :help i_ctrl-o for the details

" stop highlight
nnoremap <silent> <f2>      :nohlsearch<cr>
inoremap <silent> <f2> <c-o>:nohlsearch<cr>

" ycm
nnoremap <leader>fi :ycmcompleter fixit<cr>
nnoremap <leader>gt :ycmcompleter goto<cr>
nnoremap <leader>gd :ycmcompleter gotodefinition<cr>
nnoremap <leader>gh :ycmcompleter gotodeclaration<cr>
nnoremap <leader>gr :ycmcompleter gotoreferences<cr>

" for quickfix, tab, file jumping ... 
nmap <f11>   :cn<cr>
nmap <f12>   :cp<cr>
nmap <m-f11> :copen<cr>
nmap <m-f12> :cclose<cr>
nmap <c-f11> :tn<cr>
nmap <c-f12> :tp<cr>
nmap <s-f11> :n<cr>
nmap <s-f12> :prev<cr>


" replace the word under the cursor
" <leader>v means \v , :help leader
" nomarl mode and visual mode.
nnoremap <leader>v viw"0p
vnoremap <leader>v    "0p

" tabar
" nnoremap <f9>      :tagbartoggle<cr>
" inoremap <f9> <c-o>:tagbartoggle<cr>

" f9 + tab to show the recent used files in terminal
if !has('gui_running') 
    if has('wildmenu')
        set wildmenu
        set cpoptions-=<
        set wildcharm=<c-z>
        nnoremap <f9>   :emenu <c-z>
        inoremap <f9> <c-o>:emenu <c-z>
    endif
endif

" asyncrun make
nnoremap <f5>  :if g:asyncrun_status != 'running'<bar>
                 \if &modifiable<bar>
                   \update<bar>
                 \endif<bar>
                 \exec 'make'<bar>
               \else<bar>
                 \asyncstop<bar>
               \endif<cr>

" for clang-format, ubuntu 18.04
" need to copy .vim/.clang-format to the souce code root dir.
noremap <silent> <tab>  :pyxf /usr/share/clang/clang-format-6.0/clang-format.py<cr>

" enable man
source $vimruntime/ftplugin/man.vim

set keywordprg=:man


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme molokai
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme  molokai  
set t_co=256
set background=dark
let g:molokai_original = 1
"let g:rehash256 = 1

" open quickfix when asyncrun
let g:asyncrun_open = 10

" set $colorterm as true color or 24bit
" if has('termguicolors') &&
" 	      \($COLORTERM == 'truecolor' || $COLORTERM == '24bit')
" 	  set termguicolors
" endif
" https://github.com/tmux/tmux/issues/1246, make it works in vim under tmux.
if exists('+termguicolors')
	  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	      set termguicolors
endif

" For vim-gitgutter
"
" highlight! link SignColumn LineNr
" highlight GitGutterAdd    guifg=#009900 ctermfg=2
" highlight GitGutterChange guifg=#bbbb00 ctermfg=3
" highlight GitGutterDelete guifg=#ff2222 ctermfg=1
" let g:gitgutter_set_sign_backgrounds = 1

" For Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" Good for n<C-^> to swith buffer
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#overflow_marker = '?'
let g:airline#extensions#tabline#show_tab_nr = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Supports chinese
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileencodings=utf-8,ucs-bom,gb18030,latin1,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8



" Include system tags(system head file) and tags of parent directory
" set tags=./tags,../tags,../../tags,tags,/usr/local/etc/systags
set tags=./tags;,tags,/usr/local/etc/systags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration for markdown-preview.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''


let g:LargeFile = 100

" Disable folding of vim-markdown, set [no]foldenable -> Control manually.
let g:vim_markdown_folding_disabled = 1

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '?${name}?'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" For C/C... Language
" :help ft-c-syntax
let g:c_space_errors = 1
let g:c_gnu = 1
let g:c_no_cformat = 1
let g:c_no_curly_error = 1
if exists('g:c_comment_strings')
    unlet g:c_comment_strings
endif

" Update tags automaticly when saving files.
" ludovicchabant/vim-gutentags  is advanced.
function! AppendCtagsForC(file_path)
  let saved_path = getcwd()
  exe 'lcd ' . a:root_path
  exe 'silent !ctags --languages=c --langmap=c:.c.h --fields=+S -a '
        \. a:file_path
  exe 'lcd ' . saved_path
endfunction

au BufWritePost /project/path/*  call
      \ AppendCtagsForC('/project/path/', expand('%'))

" Python-mode
function! IsGitRepo()
  " This function requires GitPython
  if has('pythonx')
pythonx << EOF
try:
      import git
except ImportError:
      pass
import vim

def is_git_repo():
    try:
        _ = git.Repo('.', search_parent_directories=True).git_dir
        return 1
    except:
        return 0
EOF
        return pyxeval('is_git_repo()')
    else
        return 0
    endif
endfunction

let g:pymode_rope = IsGitRepo()
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 0
let g:pymode_syntax_print_as_function = 1
let g:pymode_syntax_string_format = 0
let g:pymode_syntax_string_templates = 0
" Fold the code
" let g:pymode_folding = 1
" Code check
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']



"YCM
" Disable text prompt when the cursor has a long stay
let g:ycm_auto_hover = ''
" Auto complete in comments
let g:ycm_complete_in_comments = 1
let g:ycm_filetype_whitelist = {
      \ 'c': 1,
      \ 'cpp': 1,
      \ 'python': 1,
      \ 'vim': 1,
      \ 'sh': 1,
      \ 'zsh': 1,
      \ }
let g:ycm_goto_buffer_command = 'split-or-existing-window'
let g:ycm_key_invoke_completion = '<C-Z>'

" Close quickfix if it is the last window
aug QFClose
  au!
  au WinEnter *  if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END
