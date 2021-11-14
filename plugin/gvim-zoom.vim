" Author        : Albert Alonso
" Created       : 14/11/2021
" License       : MIT
" Description   : Vim plugin that lets you increase and decrease font size on GVim.

if exists('g:gvim_zoom_loaded')
  finish
endif

let g:gvim_zoom_loaded = 1

" Configurations FLAGS
let g:gvim_zoom_increment = 1

" Linux systems and Win/Mac have different types of configurations.
if has("gui_gtk3") || has("gui_gtk2")
    function! FontUp ()
      let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole + g:gvim_zoom_increment
      let l:new_font_size = ' '.l:gf_size_whole
      let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
    endfunction

    function! FontDown ()
      let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole - g:gvim_zoom_increment
      let l:new_font_size = ' '.l:gf_size_whole
      let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
    endfunction
else 
    function! FontUp ()
      let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole + g:gvim_zoom_increment
      let l:new_font_size = ':h'.l:gf_size_whole
      let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
    endfunction

    function! FontDown ()
      let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole - g:gvim_zoom_increment
      let l:new_font_size = ':h'.l:gf_size_whole
      let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
    endfunction
endif

command! FontIncrease call FontUp()
command! FontDecrease call FontDown()

if has("gui_running")
    nmap <C-_> :FontDecrease<CR>
    nmap <C-=> :FontIncrease<CR>
endif

