let mapleader = ","

" Search files
nmap <leader>a :Files<CR>
" Git files (git ls-files)
nmap <leader>p :GFiles<CR>
" Git files (git status) (edited files)
nmap <leader>e :GFiles?<CR>
" Files in buffer
nmap <leader>b :Buffers<CR>
" Files in history
nmap <leader>h :History<CR>

" Search lines in current buffer
nmap <leader>f :BLines<CR>
" Search in all workspace files, respects .gitignore (ripgrep)
nmap <leader>rg :Rg<CR>
" Search in all workspace files (The Silver Searcher)
nmap <leader>ag :Ag<CR>

" <tab> for next buffer and shift+<tab> for previous
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
nmap <leader>w :bd<CR> " Close current buffer

" Find symbol of current document
nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <leader>s  :<C-u>CocList -I symbols<cr>
" Go to definition
nmap <leader>gd <Plug>(coc-definition)

" Disable search highlighting until the next search
nmap <leader>l :noh<CR>

" Insert new line without leaving normal mode
nmap ö m`o<Esc>``
nmap Ö m`O<Esc>``

" Move selection up or down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Reveal current file
nmap <leader>n :Fern . -reveal=%<CR>

" Git blame current line
nnoremap <Leader>gb :<C-u>call gitblame#echo()<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Adjust split size
nnoremap <c-Left> :vertical resize +3<CR>
nnoremap <c-Right> :vertical resize -3<CR>
nnoremap <c-Up> :resize +3<CR>
nnoremap <c-Down> :resize -3<CR>

" Change 2 split windows form horizontal to vertical or the other way around
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

set ignorecase " Case-insensitive searching
set smartcase  " But case-sensitive if expression contains a capital letter
set number relativenumber " Hybrid line numbers
set hlsearch      " highlight all search matches
set laststatus=2  " make lightline work with single window
set noshowmode    " hide mode since lightline handles that
set autoread      " Automatically re-read files changed outside Vim
set updatetime=100
set signcolumn=yes " Always show sign column
set clipboard+=unnamedplus " Use clipboard for y and p
set noswapfile
set exrc
set secure
" set cmdheight=2                         " More space for displaying messages (is this useful?)
set hidden                              " Required to be able to open another buffer without saving the current one
set background=dark                     " tell vim what the background color looks like
set cursorline                          " Enable highlighting of the current line
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'tomtom/tcomment_vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sleuth' " Automatically adjust tab settings
Plug 'farmergreg/vim-lastplace' " Remember last place in files
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'chaoren/vim-wordmotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat' " Eenhances the . operator to work with vim-surround
Plug 'wellle/targets.vim'
Plug 'machakann/vim-highlightedyank' " Briefly highlight which text was yanked
Plug 'nelstrom/vim-visual-star-search' " Allows * and # searches to occur on the current visual selection
Plug 'sheerun/vim-polyglot'
Plug 'michaeljsmith/vim-indent-object'
Plug 'zivyangll/git-blame.vim'

" Themes
Plug 'bluz71/vim-moonfly-colors'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" brew install bat <- Enable syntax highlight in preview

Plug 'tmsvg/pear-tree'
let g:pear_tree_repeatable_expand = 0

Plug 'Yggdroot/indentLine'
let g:indentLine_char       = '▏'
let g:indentLine_setConceal = 1
let g:indentLine_enabled = 1

Plug 'dense-analysis/ale'
let g:ale_php_phpcs_executable='./vendor/bin/phpcs'
let g:ale_linters = {'php': ['php', 'phpcs']}

Plug 'vim-test/vim-test'
let test#strategy = "neovim"
nmap <leader>tn :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>ts :TestSuite<CR>
nmap <leader>tl :TestLast<CR>
nmap <leader>tg :TestVisit<CR>
" To scroll in test results
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

Plug 'mbbill/undotree'
let g:undotree_HighlightChangedWithSign = 0
let g:undotree_WindowLayout             = 4
let g:undotree_SetFocusWhenToggle       = 1
nnoremap <Leader>u :UndotreeToggle<CR>

Plug 'hrsh7th/vim-vsnip'
imap <expr> <C-j> vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"
imap <expr> <C-k> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)"      : "<C-k>"

Plug '907th/vim-auto-save'
let g:auto_save        = 1
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "FocusLost"]

Plug 'rhysd/clever-f.vim'
let g:clever_f_across_no_line    = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_smart_case        = 1

Plug 'justinmk/vim-sneak'
let g:sneak#s_next = 1

Plug 'ap/vim-buftabline'
let g:buftabline_show = 1

Plug 'vim-vdebug/vdebug'
if !exists('g:vdebug_options')
  let g:vdebug_options = {}
endif
" Example: let g:vdebug_options.path_maps = {'/app': '/Users/Username/Apps/MyApp'}
call plug#end()

if (has('termguicolors'))
  set termguicolors
endif

syntax on
colorscheme moonfly

let g:moonflyCursorColor = 1
let g:moonflyUnderlineMatchParen = 1
let g:lightline = {
  \ 'colorscheme': 'moonfly',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead'
  \ },
  \ }

" Make vim-highlightedyank work with this color theme
highlight HighlightedyankRegion cterm=reverse gui=reverse

" Make buftabline more discrete
hi TabLineFill guibg=#000
hi TabLine guibg=#000
hi TabLineSel guibg=#000

" vdebug breakpoint color
hi default DbgBreakptLine term=reverse ctermfg=White ctermbg=Green guifg=#ffffff guibg=none
hi default DbgBreakptSign term=reverse ctermfg=White ctermbg=Green guifg=#ffffff guibg=none

" Disable netrw
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1

" Show fern when opening a dir
augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END
function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

command! FormatJSON :execute '%!python -m json.tool'
command! FormatXML :execute '%!xmllint --format %'
command! CountLastSearch :execute '%s///gn'
command! ShowTrailingWhitespace :execute '/\s\+$'
command! ReloadVim :execute ':source $MYVIMRC'

