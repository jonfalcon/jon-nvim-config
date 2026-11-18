return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false }, -- Disable inline ghost text if you only want Chat/Agent
      panel = { enabled = false },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "zbirenbaum/copilot.lua",
    },
    keys = {
      { "<leader>aa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
      { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle CodeCompanion Chat" },
      { "<leader>ai", "<cmd>CodeCompanion<cr>", mode = { "n", "v" }, desc = "CodeCompanion Inline Assistant" },
      { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add selection to CodeCompanion Chat" },
    },
    opts = {
      strategies = {
        chat = {
          adapter = "copilot",
          -- Enable agentic tool groups by default or trigger them via @full_stack_dev in chat
          roles = {
            llm = "CodeCompanion (Copilot)",
            user = "Junlue",
          },
        },
        inline = {
          adapter = "copilot",
        },
        agent = {
          adapter = "copilot",
        },
      },
      adapters = {
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                -- Choose your preferred Copilot-hosted model (e.g., "claude-sonnet-4", "gpt-4o", "o3-mini")
                default = "claude-sonnet-4",
              },
            },
          })
        end,
      },
      display = {
        chat = {
          window = {
            layout = "vertical", -- "vertical", "horizontal", or "float"
            width = 0.4,
          },
          show_settings = true, -- Displays current model and parameters at the top of the chat
        },
      },
    },
  },
}
