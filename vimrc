call pathogen#runtime_append_all_bundles()
filetype off
filetype on
set tabstop=4
set shiftwidth=4
set expandtab
retab
set autoindent
set smartindent
set autochdir
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

au BufRead,BufNewFile *.js set ft=javascript.jquery
