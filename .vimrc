"i 行番号を表示
set number
" カーソル行のハイライト
set cursorline
" 入力中のコマンドの表示
set showcmd
" ファイル上部にパス等表示
set title
" シンタックスハイライトを有効にする
syntax enable
" 全角文字が半角文字と重ならないようにする
set ambiwidth=double
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" jjでescapeできるように
inoremap <silent> jj <ESC>

autocmd Colorscheme * highlight FullWidthSpace Ctermbg=black
autocmd VimEnter * match FullWidthSpace / /
colorscheme desert

set fenc=utf-8
set whichwrap=b,s,h,l,<,>,[,],~
set backspace=indent,eol,start

" Leaderキーをspaceキーに設定
let mapleader = "\<Space>"

" space aで全選択
nnoremap <Leader>a ggVG
" space sで保存
nnoremap <Leader>s :w<CR>
" space qで終了
nnoremap <Leader>q :q<CR>
