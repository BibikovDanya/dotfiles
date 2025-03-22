return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      auto_install = true,
    }
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_nvim_lsp.default_capabilities()
      )


      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.bashls.setup({
        capabilities = capabilities })
      lspconfig.jsonls.setup({
        capabilities = capabilities })
      lspconfig.yamlls.setup({
        capabilities = capabilities,
        filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" }
      })
      lspconfig.marksman.setup({
        capabilities = capabilities })
      --  lspconfig.jdtls.setup({})
      lspconfig.sqlls.setup({
        capabilities = capabilities })
      lspconfig.lemminx.setup({
        capabilities = capabilities })
      lspconfig.kotlin_language_server.setup({
        capabilities = capabilities })
    end
  }
}
