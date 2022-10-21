set number 
set relativenumber
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set noswapfile
set splitbelow splitright
set wildmode=longest,list,full
set mouse=

" vs alt keybind
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <A-C-j> yyp
nnoremap <A-C-k> yyP
