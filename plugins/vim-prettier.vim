let g:prettier#autoformat = 0
let g:prettier#quickfix_enabled = 0

autocmd BufWritePre *.js,*.ts,*.vue,*.css,*.scss,*.json,*.md PrettierAsync

