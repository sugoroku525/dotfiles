" vim-plugもろもろ
call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'
" syntax check
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()			


" タブでCOCの予測変換を補足する
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
	        \ CheckBackspace() ? "\<Tab>" :
			      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


function! CheckBackspace() abort
		  let col = col('.') - 1
		    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" cocのエラー・警告の色
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172


" vimを開いた時にNERDTreeを開く
autocmd vimenter * NERDTree
"他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 行番号を表示
set number
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
"ハイライトサーチ
set hls
" jjでescapeできるように
inoremap <silent> jj <ESC>\
"自動コメントアウトをオフに
autocmd FileType * set formatoptions-=ro
" タブを4文字分に
set tabstop=4
" solarrized lightのテーマ
set background=light
colorscheme solarized

" ヤンクをクリップボードに保持
set clipboard+=unnamed
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
" space spaceでビジュアルラインモードに
nnoremap <Leader><Leader> V 
" space nでNERDTreeを表示
nnoremap <Leader>n :NERDTreeToggle<CR>
" space eでハイライトサーチをオフに
nnoremap <Leader>o :noh<CR>
" space mでカーソルを移動
nnoremap <Leader>m <C-w>w
" ctrl hで左にタブ移動
map <C-h> gT
" ctrl lで右にタブ移動
map <C-l> gt


" fzfでファイル, 単語検索　
" ファイル内で単語検索
nnoremap <silent> <Leader>f :Lines<CR>
" 単語検索
nnoremap <silent> <Leader>r :Rg<CR> 
" ファイル検索
nnoremap <silent> <Leader>ff :Files<CR>

" マウスの有効化
set mouse=a



