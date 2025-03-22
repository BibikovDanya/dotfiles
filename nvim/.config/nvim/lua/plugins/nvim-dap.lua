return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
    },
    lazy = true,
    config = function()
      local dap = require "dap"
      require("nvim-dap-virtual-text").setup()
      dap.adapters.kotlin = {
        type = "executable",
        command = "kotlin-debug-adapter",
        options = { auto_continue_if_many_stopped = false },
      }

      dap.configurations.kotlin = {
        {
          type = "kotlin",
          request = "launch",
          name = "This file",
          mainClass = function()
            local root = vim.fs.find("src", { path = vim.uv.cwd(), upward = true, stop = vim.env.HOME })[1] or ""
            local fname = vim.api.nvim_buf_get_name(0)
            return fname:gsub(root, ""):gsub("main/kotlin/", ""):gsub(".kt", "Kt"):gsub("/", "."):sub(2, -1)
          end,
          projectRoot = "${workspaceFolder}",
          jsonLogFile = "",
          enableJsonLogging = false,
        },
        {
          type = "kotlin",
          request = "attach",
          name = "Attach to debugging session",
          port = 5005,
          args = {},
          projectRoot = vim.fn.getcwd,
          hostName = "localhost",
          timeout = 2000,
        },

      }
      vim.keymap.set("n", "<F2>", function()
        dap.terminate()
      end, { desc = "Stop debugging" })

      vim.keymap.set("n", "<F5>", function()
        dap.continue()
      end, { desc = "Continue debugging" })

      vim.keymap.set("n", "<F6>", function()
        dap.repl.open()
      end, { desc = "Open REPL" })

      vim.keymap.set("n", "<F7>", function()
        dap.run_to_cursor()
      end, { desc = "Run debugging to cursor" })

      vim.keymap.set("n", "<F10>", function()
        dap.step_over()
      end, { desc = "Step over" })

      vim.keymap.set("n", "<F11>", function()
        dap.step_into()
      end, { desc = "Step into" })

      vim.keymap.set("n", "<F12>", function()
        dap.step_out()
      end, { desc = "Step out" })

      vim.keymap.set("n", "<leader>Db", function()
        dap.toggle_breakpoint()
      end, {
        desc = "Toggle Debug breakpoint",
      })

      vim.keymap.set("n", "<leader>DB", function()
        local condition = vim.fn.input "Breakpoint condition: "
        dap.set_breakpoint(condition)
      end, {
        desc = "Toggle Debug conditional Breakpoint",
      })
    end,
  },
}
