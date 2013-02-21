call vice#Extend({
    \ 'addons': [
        \ 'github:tpope/vim-fugitive',
        \ 'github:tpope/vim-git',
    \],
    \ 'commands': {
        \ 'Gist': ['github:mattn/gist-vim', 'github:mattn/webapi-vim'],
        \ 'Gitv': ['github:gregsexton/gitv'],
    \ },
\ })

exe 'so '.g:vice.addons_dir.'/vim-fugitive/plugin/fugitive.vim'

" Gitv {{{
    let g:Gitv_WipeAllOnClose = 1
    let g:Gitv_OpenPreviewOnLaunch = 1
    let g:Gitv_DoNotMapCtrlKey = 1
    " set lazyredraw
    " augroup git
    "     au!
    "     au FileType git setl foldlevel=99
    " augroup END
" }}}

" Git commit {{{
    au FileType gitcommit call vice#git#Commit()
    au FileType gitcommit setl textwidth=80
" }}}

cabbrev gist <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Gist' : 'gist')<CR>
cabbrev git <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Git' : 'git')<CR>
cabbrev gl <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Glog!' : 'gl')<CR>

nnoremap <leader>gb :Gbrowse<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>ge :Gedit<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gl :silent! Glog!<cr>:redraw!<cr>
nnoremap <leader>gc :silent! Gcommit -a<cr>
