let g:slimv_swank_cmd = "!ros -e '(ql:quickload :swank) (swank:create-server)' wait > /dev/null 2> /dev/null &"
let g:slimv_lisp = 'ros run'
let g:slimv_impl = 'sbcl'

