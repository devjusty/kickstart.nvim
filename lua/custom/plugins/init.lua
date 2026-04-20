-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  {
    'dmtrKovalenko/fff.nvim',
    build = function() require('fff.download').download_or_build_binary() end,
    lazy = false,
    keys = {
      {
        'ff',
        function() require('fff').find_files() end,
        desc = 'FFFind files',
      },
      {
        'fg',
        function() require('fff').live_grep() end,
        desc = 'LiFFFe grep',
      },
      {
        'fz',
        function()
          require('fff').live_grep {
            grep = {
              modes = { 'fuzzy', 'plain' },
            },
          }
        end,
        desc = 'Live fffuzy grep',
      },
      {
        'fc',
        function() require('fff').live_grep { query = vim.fn.expand '<cword>' } end,
        desc = 'Search current word',
      },
    },
    opts = {
      lazy_sync = true,
      debug = {
        enabled = true,
        show_scores = true,
      },
    },
  },
}
