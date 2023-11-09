-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Function signature help plugin for CMP
  {
    'hrsh7th/cmp-nvim-lsp-signature-help'
  },

  -- Gruvbox theme
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      -- Initialize and configure gruvbox.nvim
      require("gruvbox").setup({
        contrast = "hard", -- can be "hard", "soft" or empty string
        transparent_mode = true,
      })
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd.colorscheme('gruvbox')
    end,
  },

  -- Telescope FZF native
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },

  -- Context for current scope
  {
    'nvim-treesitter/nvim-treesitter-context'
  },

  -- Autosave
  -- { 'Pocco81/auto-save.nvim' },

  -- Autoclose brackets/quotes
  {
    'm4xshen/autoclose.nvim',
    opts = {
      keys = {
        ["'"] = { disabled_filetypes = { "rust" } }
      }
    }
  }
}
