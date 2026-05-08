" ============================================================
" 0. プラグイン管理 (vim-plug)
" ============================================================
call plug#begin('~/.vim/plugged')

" LaTeX用強力補完プラグイン
Plug 'lervag/vimtex'

" 自動補完（常にONにする）軽量プラグインを追加
Plug 'lifepillar/vim-mucomplete'

call plug#end()
" ============================================================
" 1. Leader キーの設定 (スペースを特等席に)
" ============================================================
let mapleader = "\<Space>"

" スペース + w で保存
nnoremap <Leader>w :w<CR>
nnoremap <Leader>e $
" スペース + q で終了
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>
" スペース + h で検索ハイライトを消す (EscEscより指が楽かもしれません)
nnoremap <Leader>h :nohlsearch<CR>

" バッファ（開いているファイル）の切り替え
" スペース + n で次、スペース + p で前
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>

" ヴィジュアルモードで スペース+スペース でノーマルモードに戻る（トグル）
vnoremap <Leader><Leader> <Esc>
" Space + j でコマンド入力状態にする (:! まで打たれた状態になる)
nnoremap <Leader>j :! 

nnoremap <Leader>; :
nnoremap <Leader>s ?
nnoremap <Leader>r :%s /
nnoremap <Leader>e $

" ============================================================
" 2. 表示・外観・編集設定 (タブ幅2)
" ============================================================
set number          " 行番号を表示
set encoding=utf-8
set title           " 編集中のファイル名をタイトルバーに表示
set showmatch       " 括弧の対応を強調
syntax enable
syntax on           " シンタックスハイライト有効

set tabstop=2       " タブ幅2
set shiftwidth=2    " インデント幅2
set expandtab       " タブをスペースに
set autoindent
set smartindent
set backspace=indent,eol,start
set clipboard+=unnamed,unnamedplus

" ============================================================
" 3. 検索設定 (移動の効率化を追加)
" ============================================================
set ignorecase      " 大文字小文字区別なし
set smartcase       " 大文字が含まれる時は区別
set incsearch       " 入力中から検索
set hlsearch        " ハイライト

" ============================================================
" 4. その他・便利設定
" ============================================================
set mouse=a
set noswapfile
set hidden

" [変更禁止エリア: コマンドライン移動]
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Del>

" [変更禁止エリア: 履歴呼び出し]
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" [変更禁止エリア: zenhan.exe IME自動オフ]
let g:zenhan_path = '/mnt/c/zenhan.exe'
autocmd InsertLeave * call system(g:zenhan_path . ' 0')

" --- モード切り替え ---
" 遠い Esc キーの代わりに jj を使う
inoremap <silent> jj <Esc>

" --- 検索ハイライトの解除 ---
" Esc 2回で検索のハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR>

" ファイル形式の検出、プラグイン、インデントをすべて有効化
filetype plugin indent on

" 構文に基づいた補完（オムニ補完）を有効化
set omnifunc=syntaxcomplete#Complete

" ============================================================
" 自動補完 (mucomplete) の設定
" ============================================================
" ポップアップメニューの表示方法（必須設定）
" set completeopt=menuone,noinsert,noselect

" 起動時から自動補完を常にONにする
" let g:mucomplete#enable_auto_at_startup = 1
