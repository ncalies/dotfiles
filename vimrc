set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rake'
Bundle "scrooloose/nerdtree"
Bundle "scrooloose/syntastic"
Bundle "jc00ke/nerdcommenter"
Bundle "msanders/snipmate.vim"
Bundle "vim-ruby/vim-ruby"
Bundle "jc00ke/taglist.vim"
Bundle "jc00ke/vim-tomdoc"
Bundle "mileszs/ack.vim"
Bundle "tsaleh/vim-supertab"
Bundle "tsaleh/vim-align"
Bundle "tsaleh/vim-matchit"
Bundle "kana/vim-textobj-user"
Bundle "nelstrom/vim-textobj-rubyblock"
Bundle "michaeljsmith/vim-indent-object"
Bundle "motemen/git-vim"
Bundle "adamlowe/vim-slurper"
Bundle "kchmck/vim-coffee-script"
Bundle "int3/vim-extradite"
Bundle "altercation/vim-colors-solarized"
Bundle "juvenn/mustache.vim"
Bundle "kien/ctrlp.vim"
Bundle "nathanaelkane/vim-indent-guides"
Bundle "bbommarito/vim-slim"
Bundle "mattn/gist-vim"
Bundle "benmills/vimux"
Bundle "jgdavey/vim-blockle"
Bundle "Lokaltog/vim-powerline"
Bundle "jQuery"
syntax on

filetype plugin indent on
runtime macros/matchit.vim
set tabstop=2
set shiftwidth=2
set expandtab
retab
set autoindent
set smartindent
set cursorline
set splitbelow
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

set foldmethod=indent
set foldcolumn=0
set foldnestmax=8
set foldlevel=3
set nobackup
set noswapfile
set number

set noerrorbells
set visualbell
set t_Co=256
let g:solarized_termcolors=256
let g:indent_guides_auto_colors=0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

let g:gist_clip_command='xclip -selection clipboard'
let g:gist_detect_filetype=1
let g:github_token=$GITHUB_TOKEN

set background=dark
if &diff
  set background=light
endif
colorscheme solarized

let mapleader=","
autocmd BufWritePre * :%s/\s\+$//e

" Execute open rspec buffer
" Thanks to Ian Smith-Heisters
function! RunSpec(args)
    if exists("b:rails_root") && filereadable(b:rails_root . "/script/spec")
        let spec = b:rails_root . "/script/spec"
    else
        let spec = "rspec"
    end
    let cmd = ":! " . spec . " % -cfn " . a:args
    execute cmd
endfunction

function! Privatize()
    let priorMethod = PriorMethodDefinition()
    exec "normal iprivate :" . priorMethod  . "\<Esc>=="
endfunction

function! PriorMethodDefinition()
    let lineNumber = search('def', 'bn')
    let line       = getline(lineNumber)
    if line == 0
        echo "No prior method definition found"
    endif
    return matchlist(line, 'def \(\w\+\).*')[1]
endfunction

map <Leader>p :call Privatize()<CR>
map <F9> :IndentGuidesToggle<CR>

" Mappings
" run one rspec example or describe block based on cursor position
map !s :call RunSpec("-l " . <C-r>=line('.')<CR>)
" run full rspec file
map !S :call RunSpec("")

map <F2> :NERDTreeToggle<CR>
" Map for less hand movement
au BufRead,BufNewFile *.js set ft=javascript.jquery
au BufRead,BufNewFile *.rabl setf ruby
au BufRead,BufNewFile Guardfile setf ruby
au BufRead,BufNewFile *.ejs setf html

if has("autocmd")
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

map <F3> :set go-=m go-=T <CR>
map <F4> :set go+=m go+=T <CR>
inoremap jj <Esc>
inoremap kk <Esc>:w<CR>
nnoremap <Leader>a :Ack 
nnoremap <Leader>j gT
nnoremap <Leader>k gt
nnoremap :wgaq :w <CR> :GitAdd <CR> :q <CR>
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
