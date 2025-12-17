return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require('neo-tree').setup({
     filesystem = {
        window = {
          mappings = {
            ["h"] = "close_node",   -- Закрыть директорию
            ["l"] = "open",         -- Открыть директорию/файл
            ["j"] = "open_below",   -- Вниз
            ["k"] = "open_above",   -- Вверх
          },
        }}})
  end,
}
