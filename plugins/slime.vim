" 開き括弧を入力すると自動的に閉じ括弧を挿入する(デフォルト1)
let g:paredit_mode=1
" 括弧内で改行すると追加でもう一つ改行を挿入する。サブフォーム入力支援用。(デフォルト1)
let g:paredit_electric_return = 0

" connected swank serverの際、対話窓が縦分割の右側に出てくる
let g:slimv_repl_split=4
let g:slimv_repl_name='REPL'
" 評価する画面ではCtrl-Returnをすることで評価されるようにする
let g:slimv_repl_simple_eval=0

let g:slimv_lisp = 'ros run'
let g:slimv_impl = 'sbcl'

"let g:slimv_preferred='clisp'

" ====================================================================
" swank起動コマンド設定

" --------------------------------------------------------------------
" linuxのとき

" --------------------------------------------------------------------
" macOSのとき
" roswell ver. (同じターミナルの新規タブでslimvが用意したswank起動)
let g:slimv_swank_cmd = '!osascript ~/.config/nvim/config/08slimv-roswell.scpt'

" ====================================================================

" swankサーバのポート設定
let g:swank_port = 4005

" 括弧をカラフルに表示する
let g:lisp_rainbow=1

" asdf用のファイルタイプをlispに設定する
autocmd BufNewFile,BufRead *.asd set filetype=lisp

" 現在のファイルだけを対象としてタグファイルを作成
function! s:generate_lisp_tags()
  let g:slimv_ctags='ctags -a -f '.$HOME.'/.tags/lisp.tags '.expand('%:p').' --language-force=Lisp'
  call SlimvGenerateTags()
endfunction
command! -nargs=0 GenerateLispTags call <SID>generate_lisp_tags()

" 再帰的にタグファイルを作成
function! s:generate_lisp_tags_recursive()
  let g:slimv_ctags='ctags -a -f '.$HOME.'/.tags/lisp.tags -R '.expand('%:p:h').' --language-force=Lisp'
  call SlimvGenerateTags()
endfunction
command! -nargs=0 GenerateLispTagsRecursive call <SID>generate_lisp_tags_recursive()

