set clipboard=unnamedplus
set number
set cursorline
syntax enable
set hlsearch
set incsearch
set tabstop=2
set expandtab

if has('persistent_undo')
	let undo_path = expand('~/.vim/undo')
	exe 'set undodir=' .. undo_path
	set undofile
endif

set smartindent
set laststatus=2
set wildmenu

call plug#begin('~/.vim/plugged')
Plug 'lambdalisue/fern.vim'
  Plug 'yuki-yano/fern-preview.vim' " 追加
  Plug 'lambdalisue/fern-hijack.vim' " 追加
  Plug 'Shougo/ddc.vim'
	Plug 'vim-denops/denops.vim'
  Plug 'Shougo/ddc-source-around'
"  Plug 'Shougo/pum.vim'
  Plug 'Shougo/ddc-matcher_head'
  Plug 'Shougo/ddc-ui-native'
  Plug 'Shougo/ddc-sorter_rank'
call plug#end()

" <Leader>にSpaceキー割り当て
let mapleader = "\<Space>"
" 隠しファイルを表示する
let g:fern#default_hidden=1
" Fern .をSpace+eキーに置き換え
nnoremap <silent> <Leader>e :<C-u>Fern .<CR>

" 公式リポジトリを参考にキーマップを追加
function! s:fern_settings() abort
  nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
  nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
  nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
endfunction

augroup fern-settings
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END

" 使いたいsourceを指定する
call ddc#custom#patch_global('sources', ['around'])
call ddc#custom#patch_global('ui', 'native')

" sourceOptionsのmatchersにfilter指定することで、候補の一覧を制御できる
call ddc#custom#patch_global('sourceOptions', {
    \ '_': {
    \     'matchers': ['matcher_head'],
    \ }})

" ddc.vimの機能を有効にする
call ddc#enable()


