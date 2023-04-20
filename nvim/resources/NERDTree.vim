let NERDTreeQuitOnOpen=0
let NERDTreeShowHidden=1

function! s:findAndRevealPath()
    try
        let p = s:Path.New(expand("%:p"))
endfunction

function! s:findAndRevealPath()
    try
        let p = s:Path.New(resolve(expand("%:p")))
endfunction
