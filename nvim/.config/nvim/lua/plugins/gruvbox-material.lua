return {
  'f4z3r/gruvbox-material.nvim',
  name = 'gruvbox-material',
  lazy = false,
  priority = 1000,
  opts = {},


  config = function()
    require("gruvbox-material").setup({
      background = {
        transparent = true, -- set the background to transparent
      },
      transparent_background = true,
      term_colors = true,
      show_end_of_buffer = true,
    })
    --vim.cmd.colorscheme "gruvbox-material"
  end
}
