# lze (plugin lazyloader)

## link list:
https://nixcats.org/  
https://github.com/BirdeeHub/nixCats-nvim  
https://github.com/BirdeeHub/nixCats-nvim/discussions  
https://github.com/BirdeeHub/lze  
https://github.com/BirdeeHub/birdeevim  
https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/vim.section.md#what-if-your-favourite-vim-plugin-isnt-already-packaged-what-if-your-favourite-vim-plugin-isnt-already-packaged  

## these are loding hooks in lze
sometimes i pass arguments in this function  
when do i pass what arguments in those loading hooks?
```lua
after = function(plugin)
    require('lualine').setup()
end,
-- or
before = function()
    -- Configuration for plugins that don't force you to call a `setup` function
    -- for initialization should typically go in a `before`
    -- or `beforeAll` function.
    vim.g.startuptime_tries = 10
end,
```
## other things i dont fully understand
how do i set keymaps correctly

how to use neovide (https://github.com/BirdeeHub/nixCats-nvim/discussions/99)

rename this repo

how to lazyload plugins like "lualine-macro-recording" as a dependency

autoupdate (maybe use github actions)
