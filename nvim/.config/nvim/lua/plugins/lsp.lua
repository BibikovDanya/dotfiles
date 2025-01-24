return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          "lua_ls",
          "bashls",
          "jsonls",
          "yamlls",
          "marksman",
          "jdtls"
        }
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.bashls.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.yamlls.setup({
        filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" }
      })
      lspconfig.marksman.setup({})
      lspconfig.jdtls.setup({})
    end
  }
}
