return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,

    config = function()
      require("catppuccin").setup({
        transparent_background = true,
	term_colors = true,
        show_end_of_buffer = true,
      })
      vim.cmd.colorscheme "catppuccin-mocha"
    end
  }
}

