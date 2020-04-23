" base setting{
    " enable file type detect
    filetype on
    " syntax highlight
    syntax on
    " use vim setting not vi setting
    set nocompatible 
    " let backspace can use but still can use if no set (?)
    set bs=2                
    " retain the command history, ex wq
    set history=50
    " auto read file while file change outside vim
    set autoread
" }

" indent {
    " auto indent on different type
    filetype indent on
    " set auto indent
    set autoindent
    " copy indent from last line
    set copyindent
" }

" view {
    " color mod {
        set t_Co=256      
        " disable Background Color Erase
        set t_ut=
        " the color(theme) use now
        set background=dark
        colorscheme OceanicNext
    " },
    " overlength {          " highlight if one line over 80 word
    "   highlight OverLength ctermbg=white ctermfg=black guibg=#592929
    "   match OverLength /\%81v.\+/
    " },
    " show line number
    set number  
    hi CursorLineNr guifg=#73cef4 ctermfg=81 cterm=bold
" }

" tab {
    " use space to replace tab
    set expandtab       
    " 4 space while hit tab
    set softtabstop=4   
    " 4 space while auto indent
    set shiftwidth=4    
" } 

" mouse {
    " let mouse can use in vim
    set mouse=a         
" }

" scroll {
    " retain 5 line while scrolling
    set scrolloff=5
" }

" current line {
    " show current position, ex 34, 56
    set ruler
    " show current line
    set cursorline
"     set cursorcolumn
    hi CursorLine cterm=none ctermbg=16 ctermfg=none
"     hi CursorColumn cterm=none ctermbg=16 ctermfg=none
" }

" search {
    " highlight the search, it is default, comment this line is ok
    set hlsearch
    set incsearch        
" }

" some useful map {
    inoremap jk <esc>
    inoremap :quit <esc>
    nnoremap <Backspace> <left>x<esc>
    " nnoremap load <esc>:so %<CR>:noh<CR>
    " cut and paste {
        " can use <control> + <x> to cut the cursor line
        inoremap <C-x> <esc>ddi
        nnoremap <C-x> <esc>dd
        " can use <control> + <p> to paste the cursor line
        inoremap <C-v> <esc>pi
        nnoremap <C-v> <esc>p
        " can use <control> + <p> to paste the cursor line
        inoremap <C-c> <esc>yy<esc>
"         vnoremap <C-c> <esc>y<esc>
        nnoremap <C-c> <esc>:call CopyLine()<esc>
    " },
   " move {
        " can use <control> + <shift> + <left> to move to the beginning of the line
        nnoremap <C-S-left> <S-^>
        inoremap <C-S-left> <esc><S-^>i
        " can use <shift> + <right> to move to the end of the line
        nnoremap <C-S-right> <S-$>
        inoremap <C-S-right> <esc><S-$>i
    " },
    " save {
        " save file with sudo
        inoremap <C-a><C-s> <esc>:w !sudo tee > /dev/null %<CR>
        nnoremap <C-a><C-s> :w !sudo tee > /dev/null %<CR>
        " save file
        nnoremap <C-s> :w<CR>
        inoremap <C-s> <esc>:w<CR>
    " },
    " rollback {
        inoremap <C-z> <esc>ui
        nnoremap <C-z> u
    " }, 
    " tab {
        " can use shift-tab to reverse tab
        inoremap <S-tab> <esc><<i
        nnoremap <S-tab> <<
    " },
    " exit {
        
    "
" }

" comment and uncomment {
    autocmd FileType sh,ruby,python     let b:comment_leader = '# '
    autocmd FileType fstab,zsh          let b:comment_leader = '# '
    autocmd FileType apache,conf,nginx  let b:comment_leader = '# '
    autocmd FileType tex                let b:comment_leader = '% '
    autocmd FileType mail               let b:comment_leader = '> '
    autocmd FileType vim                let b:comment_leader = '" '
    autocmd FileType c,cpp              let b:comment_leader = '\/\/ '
    " default is '#'
    if !exists('b:comment_leader')
        let b:comment_leader = '# '
    endif
    noremap <C-_> :call ToggleComment(b:comment_leader)<CR>:noh<CR>
    inoremap <C-_> <esc>:call ToggleComment(b:comment_leader)<CR>:noh<CR>i
" }

function! ToggleComment(comment_leader)
    if getline('.') =~ "^". a:comment_leader
        :exe 's/^' . a:comment_leader . '//'
    else
        :exe 's/^/' . a:comment_leader . '/'
    endif
endfunction

function! CopyLine()
    :normal yy
endfunction

" close default bell sound
set visualbell

" set font
set guifont=Lucida_Console:h20
