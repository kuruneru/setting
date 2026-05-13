" ============================================================
" 1. Leader キーの設定 (スペースを特等席に)
" ============================================================
let mapleader = "\<Space>"

" スペース + w で保存
nnoremap <Leader>w :w<CR>

" スペース + e で行末へ
nnoremap <Leader>e $

" スペース + q で終了
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>

" スペース + h で検索ハイライト解除
nnoremap <Leader>h :nohlsearch<CR>

" バッファ切り替え
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>

" ヴィジュアルモード解除
vnoremap <Leader><Leader> <Esc>

" shell command
nnoremap <Leader>j :! 

" コマンドモード
nnoremap <Leader>; :

" 後方検索
nnoremap <Leader>s ? 

" 置換
nnoremap <Leader>r :%s /

" ============================================================
" 2. 表示・外観・編集設定
" ============================================================

set encoding=utf-8

" 行番号
set number

" 相対行番号（慣れたら超便利）
" set relativenumber

" 現在行を強調
set cursorline

" タイトル表示
set title

" 対応括弧強調
set showmatch

" シンタックス
syntax enable
syntax on

" true color
set termguicolors

" タブ設定
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

" Backspace 強化
set backspace=indent,eol,start

" クリップボード共有
set clipboard+=unnamed,unnamedplus

" マウス有効
set mouse=a

" swapfile 無効
set noswapfile

" buffer保持
set hidden

" undo 永続化
set undofile

" split方向を自然に
set splitbelow
set splitright

" タブや空白の可視化
set list
set listchars=tab:>-,trail:_,extends:>,precedes:<,nbsp:%

" sign column 常時表示
set signcolumn=yes

" ============================================================
" 3. 検索設定
" ============================================================

set ignorecase
set smartcase
set incsearch
set hlsearch

" ============================================================
" 4. コマンド補完
" ============================================================

set wildmenu
set wildmode=longest:full,full

" ============================================================
" 5. ステータスライン
" ============================================================

set laststatus=2
set ruler

set statusline=
set statusline+=\ %f
set statusline+=%m
set statusline+=%r
set statusline+=%=
set statusline+=[%{&ff}]
set statusline+=\ [%y]
set statusline+=\ [%l/%L]
set statusline+=\ [%p%%]

" ============================================================
" 6. コマンドライン移動
" ============================================================

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Del>

" 履歴移動
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" ============================================================
" 7. IME自動OFF
" ============================================================

let g:zenhan_path = '/mnt/c/zenhan.exe'
autocmd InsertLeave * call system(g:zenhan_path . ' 0')

" ============================================================
" 8. モード切り替え
" ============================================================

" jj で ESC
inoremap <silent> jj <Esc>

" ESC2回で検索ハイライト解除
nnoremap <Esc><Esc> :nohlsearch<CR>

" ============================================================
" 9. ウィンドウ移動
" ============================================================

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ============================================================
" 10. FileType
" ============================================================

filetype plugin indent on

" ============================================================
" 11. 補完
" ============================================================

set omnifunc=syntaxcomplete#Complete

" ============================================================
" 12. カラースキーム
" ============================================================

colorscheme habamax

" ============================================================
" 13. Plugin (必要になったら)
" ============================================================

" call plug#begin()

" Git変更表示
" Plug 'airblade/vim-gitgutter'

" call plug#end()
