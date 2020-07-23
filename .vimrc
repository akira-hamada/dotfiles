" vim customize todo
"--------------------------------------------------------------------------------------------
" change tab interface characters size into small
"
"--------------------------------------------------------------------------------------------
" Basic Settings
"--------------------------------------------------------------------------------------------
filetype plugin indent on
syntax enable
set enc=utf-8
set fenc=utf-8
set ff=unix
set ffs=unix,dos,mac
" customize indent
set autoindent
set nosmartindent
set tabstop=4
set shiftwidth=4

colorscheme desert
set number
set ruler
set cursorline
  " highlight current cursorline only active window
  augroup vimrc_set_cursorline_only_active_window
    autocmd!
    autocmd VimEnter,BufWinEnter,WinEnter * setlocal cursorline cursorcolumn
    autocmd WinLeave * setlocal nocursorline nocursorcolumn
  augroup END
set wrap
set scrolloff=10
" customize statusline
set laststatus=2
"set statusline=%1*%F%m%r%h%w%*\ [filetype:\ %Y]\ [fenc:\ %{&fenc}]\ [enc:\ %{&enc}]\ [ff:\ %{&ff}]\ %2*%{fugitive#statusline()}%*%=%c,%l%11p%%
hi User1 guifg=#000080 guibg=#c2bfa5
hi User2 guifg=#990000 guibg=#c2bfa5
set statusline=%F%m%r%h%w\ [filetype:\ %Y]\ [fenc:\ %{&fenc}]\ [enc:\ %{&enc}]\ [ff:\ %{&ff}]\ %{fugitive#statusline()}%=%c,%l%11p%%

" customize search
set hlsearch
set wrapscan
set incsearch
" ignore case when you search characters, but don't ignore case when you search upper case.
set ignorecase smartcase
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set mouse=a
" swap files
set swapfile
set directory=~/.vim/swap
" backup files
set backup
set backupdir=~/.vim/backup
" add plugin dir to runtimepath
:set runtimepath+=$HOME/.vim/plugin

set splitright " vertical split right everytime

set modifiable
set write

set autochdir

autocmd FileType php :set dictionary=~/.vim/dictionary/php.dict

" associates following extensions with filetype
autocmd BufNewFile,BufRead *.ini set filetype=php
autocmd BufNewFile,BufRead *.html set filetype=php
autocmd BufNewFile,BufRead *.rabl set filetype=ruby
autocmd BufNewFile,BufRead *.ejs set filetype=html
autocmd BufNewFile,BufRead *.cap set filetype=ruby
autocmd BufNewFile,BufRead *.cap set filetype=ruby
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.markdown set filetype=markdown

" set filetype as markdown for a new file
autocmd BufEnter * if &filetype == "project" || &filetype == "" | setlocal ft=markdown | endif

command! FullWidth :set columns=500
command! NoWrap :set nowrap
"--------------------------------------------------------------------------------------------

" set Key Map
"--------------------------------------------------------------------------------------------
" double <Esc> clears search highlight
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
noremap ; :
noremap : ;
nnoremap <SPACE> <PageDown>zz
nnoremap <S-SPACE> <PageUp>zz
" nnoremap <C-e> :<C-u>tabe $MYVIMRC<Enter>
nnoremap <C-e> :<C-u>105vs $MYVIMRC<Enter> :se nowrap<Enter>
nnoremap <C-s> :<C-u>source $MYVIMRC<Enter>
" edit zshrc
nnoremap <C-z> :<C-u>105vs $HOME/.zshrc<Enter> :se nowrap<Enter>
" open new vsplit window
nnoremap vs :<C-u>vnew<CR>
nnoremap vS :<C-u>vsplit<CR>
nnoremap <silent> <C-h> :call ShiftVbar('left', 5)<CR>
nnoremap <silent> <C-l> :call ShiftVbar('right', 5)<CR>
  function! ShiftVbar(direction, degree) "{{{
    if a:direction == 'left'
      if winnr() == 1
        let sign = '-'
      else
        let sign = '+'
      endif
  
    else
      if winnr() == 1
        let sign = '+'
      else
        let sign = '-'
      endif
  
    endif
  
    execute "vertical resize ".sign.a:degree
  endfunction "}}}

" nnoremap <S-C-j> 5<C-w>+ " comflict with IME shortcut
" nnoremap <S-C-k> 5<C-w>- " comflict with IME shortcut
" Insert new line with <RETURN> when command mode
noremap <CR> o<ESC>
" Insert new line and ; with <S-RETURN> when insert mode
inoremap <S-C-CR> <ESC>A;<ESC>o
inoremap <S-CR> <ESC>:call AppendSemiColon()<CR>a
inoremap <C-CR> <ESC>o
" move between vsplit windows
noremap <TAB> <C-w>w
noremap <C-TAB> <C-w>W
" Insert a Tab Character with <Tab> when command mode
noremap <S-TAB> i	<ESC>
" Auto Complete
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>

nnoremap <silent> <C-t> :<C-u>call SaveCurrentSession()<CR>
" execute script with quickrun.vim
nnoremap <C-q> :QuickRun<CR>
" don't register character deleted with x
nnoremap x "_x
" move page tab
nnoremap H gT
nnoremap L gt
inoremap jk <Esc>
nmap R <Plug>(operator-replace)
nnoremap <C-j> `
nnoremap / /\v
" close buffer with q, not :q<enter>
nnoremap q :<C-u>q<CR>
" record macro with Q, not q
nnoremap Q q

" grep friendly
nnoremap <C-g> <ESC>:FriendlyGrep<CR>
" switch file in quickfix
nnoremap <LEFT> :cprevious<CR>
nnoremap <RIGHT> :cnext<CR>
nnoremap <UP> :<C-u>cfirst<CR>
nnoremap <DOWN> :<C-u>clast<CR>
" handle octopress
nnoremap <C-n> <ESC>:OctopressNew<CR>
nnoremap <C-d> <ESC>:call DeployOctoPost()<CR>
" help settings
nnoremap ? :vertical h 
" transparent shortcut
nnoremap <silent> <S-UP> :call IncTransp()<CR>
  function! IncTransp() "{{{
    let t = 10 + &transparency
    if t <= 100
      execute 'set transparency='.t
    endif
  endfunction "}}}
nnoremap <silent> <S-DOWN> :call DecTransp()<CR>
  function! DecTransp() "{{{
    let t = &transparency - 10
    if t >= 0
      execute 'set transparency='.t
    endif
  endfunction "}}}

nnoremap <expr> / _(":%s/<Cursor>/&/gn")
function! s:move_cursor_pos_mapping(str, ...)
    let left = get(a:, 1, "<Left>")
    let lefts = join(map(split(matchstr(a:str, '.*<Cursor>\zs.*\ze'), '.\zs'), 'left'), "")
    return substitute(a:str, '<Cursor>', '', '') . lefts
endfunction

function! _(str)
    return s:move_cursor_pos_mapping(a:str, "\<Left>")
endfunction

function! Taller() "{{{
  let n = &lines + 3
  execute 'set lines='.n
endfunction "}}}

function! Shorter() "{{{
  let n =  &lines - 3

  if 0 < n
    execute 'set lines='.n
  endif
endfunction "}}}

"--------------------------------------------------------------------------------------------
" Manage plugins with dein.vim
"
" install steps (ref: https://github.com/Shougo/dein.vim)
"   1. curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $HOME/.vim/dein_installer.sh
"   1. sh $HOME/.vim/dein_installer.sh ~/.cache/dein
"   1. exec `:call dein#install()` in vim
"--------------------------------------------------------------------------------------------
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  " ------------------------------------------------
  " describe plugin names below, then `:call dein#install()`
  "   when you delete plugins, write `call map(dein#check_clean(), \"delete(v:val, 'plugin_name_to_delete')")` (with removing backslash)
  "   then :call dein#recache_runtimepath()
  " ------------------------------------------------
  call dein#add('vim-scripts/ShowMarks')
  call dein#add('vim-scripts/surround.vim')
  call dein#add('Shougo/denite.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp') " needed for denite and vim 8
    call dein#add('roxma/vim-hug-neovim-rpc') " needed for denite and vim 8
  endif
  call dein#add('preservim/nerdtree')
  call dein#add('vim-scripts/quickrun.vim')
  call dein#add('SirVer/ultisnips')
  call dein#add('vim-scripts/The-NERD-Commenter')
  call dein#add('vim-scripts/operator-user')
  call dein#add('vim-scripts/operator-replace')
  call dein#add('kmnk/denite-dirmark') " denite bookmark alternative
  call dein#add('Shougo/vimproc')
  call dein#add('Shougo/vimshell')
  call dein#add('tpope/vim-rails')
  call dein#add('glidenote/octoeditor.vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('kshenoy/vim-signature')
  call dein#add('vim-scripts/applescript.vim')
  " call dein#add('supermomonga/projectlocal.vim')
  call dein#add('rking/ag.vim')
  call dein#add('vim-scripts/nginx.vim')
  call dein#add('kana/vim-textobj-user')
  " vim-textobj-ruby depends on vim-textobj-user.
  call dein#add('rhysd/vim-textobj-ruby')
  call dein#add('slim-template/vim-slim')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('akira-hamada/friendly-grep.vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
"--------------------------------------------------------------------------------------------

"--------------------------------------------------------------------------------------------
" setting for vim-markdown
"--------------------------------------------------------------------------------------------
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml']
"--------------------------------------------------------------------------------------------

"--------------------------------------------------------------------------------------------
" Settings for showmarks.vim
"--------------------------------------------------------------------------------------------
let g:showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
"--------------------------------------------------------------------------------------------

"--------------------------------------
" Settings for denite
" ref
"   https://github.com/Shougo/denite.nvim/blob/master/doc/denite.txt
"   https://zaief.jp/vim/denite
"   https://qiita.com/okamos/items/4e1665ecd416ef77df7c
" how to bookmark
"   1. exec :Denite dirmark/add
"   1. hit 'b' at directory to bookmark
" TODO (upper is higher priority)
"   - denite-filter buffer内でテキストが空の時に文字の削除(BSや<C-h>)するとmove_up_pathするようにする
"   - ファイルをEnterで選択した時に現在のbufferではなく新規タブで開くようにする (ディレクトリは除く)
"   - (Vim自体の TODO) 8.2になってから %s//%/gnの検索でカーソルが色んなところに飛ぶようになったので修正
"   - uniteとファイル一覧の並びが違う気がするのでディレクトリを一律に最初に来るように変更
"   - filter内のテキストを含んでないファイルやディレクトリも表示される時がある気がするので調整
"   - denite-filter bufferのステータスラインを消したい
"   - denite buffer内の、現在位置の表示を右ではなく左(出来れば左上)にする
"   - ディレクトリだけではなくファイルもbookmarkできるようにする (denite-dirmarkの制約の可能性があるので自作するしかないかも？)
"--------------------------------------
" ファイル一覧
nnoremap <silent> ,f :<C-u>DeniteBufferDir file file:new -start-filter -filter-split-direction=top -direction=top<CR>
" ブックマーク一覧
nnoremap <silent> ,b :<C-u>Denite dirmark -start-filter -filter-split-direction=top -direction=top<CR>
" filetype一覧
nnoremap <silent> ,F :<C-u>Denite filetype -winheight=5 -start-filter -filter-split-direction=top -direction=top<CR>
nnoremap <silent> ,r :<C-u>Denite ruby_class -start-filter -filter-split-direction=top -direction=top<CR>

" settings for denite buffer
autocmd FileType denite call s:denite_my_settings()
" settings for denite filter buffer
autocmd FileType denite-filter call s:denite_filter_my_settings()

function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>    denite#do_map('do_action')
  nnoremap <silent><buffer><expr> <C-CR>  denite#do_map('do_action', 'open_file_with_new_tab')
  nnoremap <silent><buffer><expr> i       denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> u       denite#do_map('move_up_path')
  nnoremap <silent><buffer><expr> b       denite#do_map('do_action', 'add')
  nnoremap <silent><buffer><expr> v       denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> p       denite#do_map('do_action', 'preview')
  " nnoremap <silent><buffer><expr> d       denite#do_map('do_action', 'delete')
  " nnoremap <silent><buffer><expr> q       denite#do_map('quit')
  " nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction
function! s:denite_filter_my_settings() abort
  inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  " Close denite filter buffer when I hit jk (when I escape insert mode)
  imap <silent><buffer> jk <Plug>(denite_filter_quit)
  " ref for following actions: https://zaief.jp/vim/denite
  " toggle_select
  " inoremap <silent><buffer><expr> <C-j> denite#do_map('toggle_select')
  " " 一つ上のディレクトリを開き直す
  " inoremap <silent><buffer><expr> <BS> denite#do_map('move_up_path')
endfunction

" Open file with new tab.
" but it remains in denite buffer, when you select directory.
" ref
"   - https://github.com/notomo/dotfiles/blob/940af3a149df3b7a316789f35f38053c41296873/vim/rc/plugins/denite.vim#L110
"   - https://github.com/notomo/dotfiles/blob/b42de38b601fea002bd3413de70696692e5fe097/vim/autoload/notomo/denite.vim#L64
"   - denite vim help on denite#custom#action
function! s:my_own_denite_open_file_with_new_tab(context) abort
  if a:context.targets[0].kind == 'file'
    call denite#do_action(a:context, 'tabopen', a:context.targets)
  elseif a:context.targets[0].kind == 'directory'
    " TODO: 現状のbufferで選択したディレクトリを開けるようにする
    " cd '/Users/hamada.akira/code'
    " echom pwd
    " execute 'DeniteBufferDir file file:new -start-filter -filter-split-direction=top -direction=top'
    "
    " call denite#narrow('code', a:context)
  endif
endfunction
call denite#custom#action('file,directory', 'open_file_with_new_tab', function('s:my_own_denite_open_file_with_new_tab'))
"--------------------------------------

"--------------------------------------
" Settings for NerdTree
" ref
"   https://crowrabbit.hatenablog.com/entry/2019/06/04/NERDTree%E3%81%AE%E5%B0%8E%E5%85%A5
"   https://www.toumasu-program.net/entry/2019/01/28/105352
"   https://wonderwall.hatenablog.com/entry/2016/04/06/213105
"--------------------------------------
" nnoremap <silent> ,f :NERDTreeToggle<CR>
" Close NerdTree when you open a file
let g:NERDTreeQuitOnOpen = 1
" Open new Tab for <CR>, not open with current buffer.
let g:NERDTreeCustomOpenArgs = {'file':{'where': 't'}}

augroup vimrc_nerdtree
  autocmd!
  " 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる
  autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
augroup END
"--------------------------------------

"----------------------------------------------------------------------------
" settings for ultisnips(snippets)
" TODO: 既存のsnippetや設定を移行する
"       ref
"         - https://github.com/kenjinino/vim-ultisnips-ruby/blob/master/ruby_snipmate.snippets
"----------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger = "<C-k>"
let g:UltiSnipsJumpForwardTrigger = "<c-k>"
let g:UltiSnipsJumpBackwardTrigger = "<c-b>"
" load my own snippets (.vim/snippets/ is old directory)
let g:UltiSnipsSnippetDirectories = ['UltiSnips',$HOME.'/.vim/UltiSnips']

" customize neocomplcache.vim
" let g:neocomplcache_enable_auto_select = 1 " auto select first of options
" let g:neocomplcache_auto_completion_start_length = 3 " start to complete after 3 chars
" let g:neocomplcache_lock_iminsert = 1 " not use neocomplcache when IME is ON

" edit snippets file
" nnoremap <silent> <C-f> :<C-u>tabe %<CR>:<C-u>NeoSnippetEdit<CR>
"----------------------------------------------------------------------------

" customize NERD-Commenter
let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1
nmap <C-c> <Plug>NERDCommenterToggle
vmap <C-c> <Plug>NERDCommenterToggle
vnoremap <silent> <C-d> :call DupLines()<CR>
  function! DupLines()  range "{{{
    let selected_num = line("'>") - line("'<") + 1
    let ori_pos = line("'<")
    " 選択中の行をyank
    normal! ""gvy
    " yankした物をPする
    normal P
    " selected_numの分、下に移動する
    execute 'normal '.selected_num.'j'
    " Vモードに入る
    execute 'normal V'.selected_num.'j'
    " コメントアウトする
    call NERDComment(1, 'norm')
    " ビジュアルモードからエスケープ
    execute "normal! \e\e"
    " 元の位置に戻る
    execute 'normal '.ori_pos.'gg'
  endfunction "}}}

" customize surround.vim
let g:surround_{char2nr("[")} = "[\r]"
let g:surround_{char2nr("\{")} = "{\r}"
let g:surround_{char2nr("\(")} = "(\r)"

" customize octoeditor.vim
let g:octopress_path = '~/rails_projects/octopress'
let g:octopress_post_suffix = "markdown"
let g:octopress_post_date = "%Y-%m-%d %H:%M"
let g:octopress_published = 1
let g:octopress_comments = 1
let g:octopress_prompt_tags = 0
let g:octopress_prompt_categories = 1
let g:octopress_qfixgrep = 0
let g:octopress_vimfiler = 0
" let g:octopress_template_dir_path = 'path/to/dir'
"
" customize friendly_grep
let g:friendlygrep_target_dir = 'code/somewhere/*'
let g:friendlygrep_recursively = 1
let g:friendlygrep_display_result_in = 'tab'
"--------------------------------------------------------------------------------------------
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"--------------------------------------------------------------------------------------------

" vim script
"--------------------------------------------------------------------------------------------
"matchit.vimを有効化
source $VIMRUNTIME/macros/matchit.vim

" タブを開いた時の元のタブがからの場合閉じる
autocmd TabEnter * call ClosePreviousEmptyTab()

"--------------------------------------------------------
"  現在のバッファが新規作成で空のバッファの場合1を返す
"     Test it like this
"     echo BufferIsEmpty()
"--------------------------------------------------------
function! BufferIsEmpty()
    " ファイルの内容が空
    if line('$') == 1 && getline(1) == ''
        if expand('%:t') == ''
          return 1
        else
          return 0
        endif
    else
        return 0
    endif
endfunction

"--------------------------------------------------------
"  一つ前のタブに移動し空かどうかで以下の処理を行う
"  空: 閉じる
"  何らか入力されている: 元のタブへ移動
"     Test it like this
"     call CloseIfBufferEmpty()
"--------------------------------------------------------
function! ClosePreviousEmptyTab()
    exe 'normal! gT'
    if BufferIsEmpty() == 1
        exe 'q!'
    else
        exe 'normal! gt'
    endif
endfunction

"----------------------------------------
function! s:Preserve()
  " Save cursor position
  let l = line(".")
  let c = col(".")

  execute '?^\s*\(describe\|it\|context\|feature\|scenario\)\(.*\) do$'
  execute 's/\(describe\|it\|context\|feature\|scenario\)\(.*\) do$/\1\2, :focus do/'

  " Restore cursor position
  call cursor(l, c)
  " Remove search history pollution and restore last search
  call histdel("search", -2)
  let @/ = histget("search", -2)
endfunction

function! s:AddFocusTag()
  call s:Preserve()
endfunction

function! s:RemoveAllFocusTags()
  call s:Preserve("%s/, :focus//e")
endfunction

" Commands
command! -nargs=0 AddFocusTag call s:AddFocusTag()
command! -nargs=0 RemoveAllFocusTags call s:RemoveAllFocusTags()

"--------------------------------------------------------
"  execute rspec in vim terminal (requires vim 8)
"--------------------------------------------------------
" 参考: https://qiita.com/kasei-san/items/060bbd267ddc0cca5068
function! ExecuteRSpec(...)
    " 引数がある場合
    if a:0 >= 1
      " 引数を実行対象のspecとする
      let spec = a:1
    else
      " コマンド実行時にカーソルがある行のspecを実行
      let spec = expand('%:p') . ':' . line('.')
    end

    " let opts = { 'vertical': '1', 'term_cols': 60, 'hidden': '1', 'term_finish': 'open', 'term_opencmd': '60vsplit|buffer %d' }
    let opts = { 'vertical': '1', 'term_cols': 60 }

    let command = './rspec.zsh some_dir ' . spec
    call term_start(command, opts)
    " TODO: コマンド(spec)実行時のカーソルを編集中のファイルに移したい
endfunction
command! -nargs=? RSpec call ExecuteRSpec(<f-args>)
nnoremap rs <ESC>:RSpec<CR>
" ↑本当は ctrl-shift-rとかで実行したい。ctrl-shiftは無理っぽい
" nnoremap <C-S-r> <ESC>:RSpec<CR>

"--------------------------------------------------------------------------------------------
" MacVim original settings
"   Put these on the end of .vimrc.
"   because some plugin or setting override hi Tag* settings probably.
"--------------------------------------------------------------------------------------------
if has('multi_byte_ime') || has('gui_macvim')
" following lines run only with MacVim
  set guifont=Ricty\ Diminished\ bold:h14
  command! ResetFont :set guifont=Ricty\ Diminished\ bold:h14
  set cursorcolumn " display vertical cursor line
  " don't display menu bar
  set guioptions-=T
  " don't beep
  set visualbell t_vb=
  " if you yank words, it's shared with clipboard
  set clipboard=unnamed,autoselect
  " when IME enabled, set cursor following color
  highlight CursorIM guibg=skyBlue guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
  " 挿入モードでのIME状態を記憶させない
  inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
  set noimdisable
  " pop-up menu color
  highlight Pmenu guibg=white guifg=black
  highlight PmenuSel guibg=black guifg=white

  set guioptions-=e "tablineを使う
  set tabline=%!MakeTabLine()
  hi TabLineSel ctermfg=Black ctermbg=White guifg=Black guibg=White
  hi TabLine ctermfg=Black ctermfg=Gray ctermbg=black guifg=White guibg=grey21
  hi TabLineFill ctermbg=black guifg=grey8

  function! MakeTabLine() "{{{
    let titles = map(range(1, tabpagenr('$')), 's:tabpage_label(v:val)')
    let sep = ' '  " タブ間の区切り
    let tabpages = join(titles, sep) . sep . '%#TabLineFill#%T'
    let info = ''  " 好きな情報を入れる
    return tabpages . '%=' . info  " タブリストを左に、情報を右に表示
  endfunction "}}}

  function! s:tabpage_label(n) "{{{
    " t:title と言う変数があったらそれを使う
    let title = gettabvar(a:n, 'title')
    if title !=# ''
      return title
    endif

    " タブページ内のバッファのリスト
    let bufnrs = tabpagebuflist(a:n)

    " カレントタブページかどうかでハイライトを切り替える
    let hi = a:n is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'

    " バッファが複数あったらバッファ数を表示
    let no = len(bufnrs)
    if no is 1
      let no = ''
    endif
    " タブページ内に変更ありのバッファがあったら '+' を付ける
    let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? '+' : ''
    let sp = (no . mod) ==# '' ? '' : ' '  " 隙間空ける

    " カレントバッファ
    let curbufnr = bufnrs[tabpagewinnr(a:n) - 1]  " tabpagewinnr() は 1 origin
    let file = bufname(curbufnr)
    let fname= fnamemodify(file, ':p:t')
    if fname == ''
      let fname = '[No Name]'
    end

    let label = no . mod . sp . fname

    return '%' . a:n . 'T' . hi . label . '%T%#TabLineFill#'
  endfunction "}}}
endif
