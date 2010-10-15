call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
syntax on

filetype on
set tabstop=4
set shiftwidth=4
set expandtab
retab
set autoindent
set smartindent
set cursorline
set splitbelow

set foldmethod=indent
set foldcolumn=0
set foldnestmax=8
set foldlevel=3
set nobackup
set noswapfile

set noerrorbells
set visualbell
set t_Co=256
colorscheme mustang

"set autochdir
autocmd BufWritePre * :%s/\s\+$//e

" Execute open rspec buffer
" Thanks to Ian Smith-Heisters
function! RunSpec(args)
    if exists("b:rails_root") && filereadable(b:rails_root . "/script/spec")
        let spec = b:rails_root . "/script/spec"
    else
        let spec = "spec"
    end
    let cmd = ":! " . spec . " % -cfn " . a:args
    execute cmd
endfunction

" Mappings
" run one rspec example or describe block based on cursor position
map !s :call RunSpec("-l " . <C-r>=line('.')<CR>)
" run full rspec file
map !S :call RunSpec("")

map <F2> :NERDTreeToggle<CR>
" Map for less hand movement
au BufRead,BufNewFile *.js set ft=javascript.jquery

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
nnoremap <Leader>t :CommandT <CR>
nnoremap <Leader>T :CommandTFlush <CR>
nnoremap <Leader>a :Ack
nnoremap <Leader>j gT
nnoremap <Leader>k gt

set statusline=%<%f\ %y%#ErrorMsg#%m%{exists('*SyntasticStatuslineFlag')?SyntasticStatuslineFlag():''}%*%r%{exists('*rails#statusline')?rails#statusline():''}%{exists('*fugitive#statusline')?fugitive#statusline():''}%=%-14.(%l,%c%V%)\ %P
