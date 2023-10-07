" Title:        Vim Guru
" Description:  LLM powered vim advice.
" Last Change:  October 2023
" Maintainer:   Hamish Scott  <https://github.com/hamishs/vim-guru>

if exists("g:loaded_vimguru")
    finish
endif
let g:loaded_exampleplugin = 1

" Defines a package path for Lua. This facilitates importing the
" Lua modules from the plugin's dependency directory.
let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/vim-guru/deps"
exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

" Exposes the plugin's functions for use as commands in Neovim.
command! -nargs=0 Guru lua require("vim-guru").run()
