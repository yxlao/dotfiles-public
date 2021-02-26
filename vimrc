" disable vim-go new version warning: we shall upgrade vim
let g:go_version_warning = 0

" escape key
" ino ff <esc>
" cno ff <c-c>

" tab bar color
:hi TabLineFill ctermfg=237 ctermbg=237
:hi TabLine ctermfg=White ctermbg=237
" hi TabLineSel ctermfg=Red ctermbg=Yellow

" disable better white space
let g:better_whitespace_enabled = 0

" automatically close preview window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" furthermore, disable preview window
set completeopt-=preview

" indentLine guide
" Vim
let g:indentLine_color_term = 238
" GVim
let g:indentLine_color_gui = '#A4E57E'
" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)))

let g:indentLine_enabled = 1
let g:indentLine_char = '|'
" ¦, ┆, ︙ or │

" set runtimepath
set runtimepath+=vim

" backspace and delete in normal mode
" nnoremap <BS> X
" imap <C-BS> <C-W>
" new line without entering insert mode
" nmap <S-Enter> O<Esc>
" nmap <CR> O<Esc>

" by default ignore case search
" use /\C if case sensitive
set ic

" go
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1
" let g:go_fmt_command = "goimports"

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0

" vim-airline theme
" let g:airline_theme='zenburn'

" jemdoc
augroup filetypedetect
au! BufNewFile,BufRead *.jemdoc setf jemdoc
augroup END
" Last line is for proper wrapping of jemdoc lists, etc.
autocmd Filetype jemdoc setlocal comments=:#,fb:-,fb:.,fb:--,fb:..,fb:\:

" disable F1 key
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

" backspace
set backspace=2
" set backspace=indent,eol,start

" execute pathogen plugin
execute pathogen#infect()

" quick save
nmap <F2> :update<CR>
vmap <F2> <Esc><F2>gv
imap <F2> <c-o><F2>

" show command
set showcmd

" disable replace mode
imap <Insert> <Nop>
inoremap <S-Insert> <Insert>

" navigate in soft lines
" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")
map <silent> <Up> gk
imap <silent> <Up> <C-o>gk
map <silent> <Down> gj
imap <silent> <Down> <C-o>gj
map <silent> <home> g<home>
imap <silent> <home> <C-o>g<home>
map <silent> <End> g<End>
imap <silent> <End> <C-o>g<End>

" auto wrap for latex
autocmd Filetype tex,latex set tw=79
autocmd Filetype tex,latex set formatoptions+=t

" map capital letters
command WQA wqa
command WQa wqa
command Wqa wqa
command WQ wq
command Wq wq
command W w !sudo tee % > /dev/null
command Q q

" nerdcommenter
" filetype plugin on
" let NERDSpaceDelims=1
" nmap <C-_> <leader>c<Space>
" vmap <C-_> <leader>c<Space>

" leader
" let mapleader=","

" tcomment
" map <leader>c <c-_><c-_>
" map <leader>b <c-_>b
" nmap <C-_> gcc

" cholorscheme
syntax enable
colorscheme playground
" colorscheme ron
" colorscheme molokai
" colorscheme monokai
" hi Normal ctermbg=White ctermfg=Black guifg=Black guibg=White

if has("tefrminfo")
  let &t_Co=16
  let &t_AB="\<Esc>[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm"
  let &t_AF="\<Esc>[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm"
else
  let &t_Co=16
  let &t_Sf="\<Esc>[3%dm"
  let &t_Sb="\<Esc>[4%dm"
endif

" set default clipboard (use with caution)
set clipboard=unnamedplus

" ctrl+s to toggle highlight.
" let hlstate=0

" mouse
set mouse=a

" powerline enable
set laststatus=2

" open splits below and right
set splitbelow
set splitright

" smart home
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

" key maps
" nnoremap <c-Left> :tabp<CR>
" nnoremap <c-Right> :tabn<CR>
" map <CTRL-V><CTRL-PAGEUP> :tabp<CR>
" map <CTRL-V><CTRL-PAGEDOWN> :tabn<CR>
nnoremap <F7> :tabp<CR>
nnoremap <F8> :tabn<CR>
nnoremap <F12> :NERDTreeToggle<CR>
cmap nerdtree NERDTree
" use alt+arrow to navigate spilts
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
" use ctrl-[hjkl] to navigate splits
nnoremap <F5> :wincmd h<CR>
nnoremap <F6> :wincmd l<CR>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" autocomplete
set wildmenu " enhanced completion

" autocmd BufRead *.py inoremap # X<c-h>#<space>
autocmd BufRead *.py inoremap # X<c-h>#

" python-mode, pymode
set foldlevelstart=10
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on

" let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
" let g:pymode_options_max_line_length = 120
" let g:pymode_lint_config = '$HOME/.pylintrc'
let g:pymode_rope_lookup_project = 0
" let g:pymode_lint_checkers = ['pep8', 'mccabe']
" let g:pymode_lint_checkers = ['mccabe']
let g:pymode_lint_checkers = []
" let g:pymode_syntax_space_errors = 0
" let g:syntastic_ignore_files = ['\.py$']
" let g:pymode_motion = 0

" spell check
syntax spell default
map <F10> :setlocal spell! spelllang=en_us<CR>

" highlighting
au BufRead,BufNewFile *.md set filetype=markdown

" indentation
filetype plugin indent on
syntax on
set smartindent
set showmatch
set colorcolumn=80
set tabstop=4
set shiftwidth=4
set expandtab
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype java setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype tex setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
set showmode

let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
  set noexpandtab
endif

" determine tab or space
function TabsOrSpaces()
    " Determines whether to use spaces or tabs on the current buffer.
    if getfsize(bufname("%")) > 256000
        " File is very large, just use the default.
        return
    endif

    let numTabs=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^\\t"'))
    let numSpaces=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^ "'))

    if numTabs > numSpaces
        setlocal noexpandtab
    endif
endfunction
autocmd BufReadPost * call TabsOrSpaces()

" display tab chracter
" set listchars=tab:>-,trail:~,extends:>,precedes:<
set listchars=tab:>-,extends:>,precedes:<
set list

" paste mode
nnoremap <F3> : set invpaste paste? <CR>
set pastetoggle=<F3>
" auto enter paste mode
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif
  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"
  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction
let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" line number
set number
" highlight LineNr ctermfg=grey

" trim trailing whitespace, * controls filetype
autocmd BufWritePre * :%s/\s\+$//e

" scroll below the last line
set scrolloff=10

" "Use TAB to complete when typing words, else inserts TABs as usual.
" "Uses dictionary and source files to find matching words to complete.
" "See help completion for source,
" "Note: usual completion is on <C-n> but more trouble to press all the time.
" "Never type the same word twice and maybe learn a new spellings!
" "Use the Linux dictionary when spelling is in doubt.
" "Window users can copy the file to their machine.
" function! Tab_Or_Complete()
"   if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"     return "\<C-N>"
"   else
"     return "\<Tab>"
"   endif
" endfunction
" inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
" set dictionary="/usr/share/dict/american-english"
