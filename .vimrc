" vim-plugもろもろ
call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'
" dc.vim本体
Plug 'Shougo/ddc.vim'
" DenoでVimプラグインを開発するためのプラグイン
Plug 'vim-denops/denops.vim'
" ポップアップウィンドウを表示するプラグイン
Plug 'Shougo/pum.vim'
" カーソル周辺の既出単語を補完するsource
Plug 'Shougo/ddc-around'
" ファイル名を補完するsource
Plug 'LumaKernel/ddc-file'
" 単語を補完の対象にするfilter
Plug 'Shougo/ddc-matcher_head'
" 補完候補を適切にソートするfilter
Plug 'Shougo/ddc-sorter_rank'
" 補完候補の重複を防ぐためのfilter
Plug 'Shougo/ddc-converter_remove_overlap'
" LSP(Language server protocol)を使うためのプラグ
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/vim-lsp'
call plug#end()			

" pathogen
execute pathogen#infect()

" syntasticの設定
" 最初の2行はお決まりの設定
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
" 明示的に文法チェックを走らせる
let g:syntastic_mode_map = {'mode': 'passive'} 
" insertモード抜けた時, バッファが変更された時にsyntasticを呼び出す
augroup AutoSyntastic
	autocmd!
	autocmd InsertLeave,TextChanged * call s:syntastic() 
augroup END
" 保存とsyntasticによる文法チェック
function! s:syntastic()
	w
	SyntasticCheck
endfunction


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
set background=light
colorscheme solarized
	
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
" 保存せずに終了
nnoremap <Leader>w :q!<CR>
" space rでwindowを全て閉じる
nnoremap <Leader>qa :qa<CR>
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
set ttymouse=xterm2

" 予測変換のための設定
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sources', [
	\ 'around',
	\ 'vim-lsp',
	\ 'file'
 	\])
call ddc#custom#patch_global('sourceOptions', {
	\ '_': {
	\   'matchers': ['matcher_head'],
	\   'sorters': ['sorter_rank'],
	\   'converters': ['converter_remove_overlap'],
	\ },
	\ 'around': {'mark': 'Around'},
	\ 'vim-lsp': {
	\   'mark': 'LSP', 
	\   'matchers': ['matcher_head'],
	\   'forceCompletionPattern': '\.|:|->|"\w+/*'
 	\ },
 	\ 'file': {
  	\   'mark': 'file',
   	\   'isVolatile': v:true, 
    \   'forceCompletionPattern': '\S/\S*'
    \ }})
call ddc#enable()
" inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
" inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>

