# lze (plugin lazyloader)

## link list:
https://nixcats.org/  
https://github.com/BirdeeHub/nixCats-nvim  
https://github.com/BirdeeHub/nixCats-nvim/discussions  
https://github.com/BirdeeHub/lze  

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

how do i install plugins that are not in nixpkgs

how to use neovide (https://github.com/BirdeeHub/nixCats-nvim/discussions/99)
