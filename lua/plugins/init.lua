return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre' -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvimtree",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      PATH = "append",
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "prettierd",
        "eslint-lsp",
        -- "emmet-ls",
        "json-lsp",
        "tailwindcss-language-server",

        -- shell
        "shfmt",
        "shellcheck",
        "bash-language-server",

        "clangd",
        "clang-format",

        -- python
        "pyright",
        "ruff",
        "mypy",
        "black",

        -- golang
        -- "gofumpt", --require go1.20
        "goimports-reviser",
        "gopls",
        "delve",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
          enable = true,
          max_lines = 0,
          min_window_height = 0,
          line_numbers = true,
          multiline_threshold = 20,
          trim_scope = "outer",
          mode = "cursor",
          separator = nil,
          zindex = 20,
          on_attach = nil,
        },
        config = function(_, opts)
          require("treesitter-context").setup(opts)
        end,
      },
    },
    opts = require "configs.treesitter",
  },
  -- {
  --   "zeioth/garbage-day.nvim",
  --   dependencies = "neovim/nvim-lspconfig",
  --   event = "VeryLazy",
  --   opts = {
  --     excluded_lsp_clients = { "null-ls", "jdtls" },
  --     grace_period = 60 * 10,
  --   },
  -- },
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup()
    end,
  },

  -- autoclose tags in html, jsx only
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- get highlight group under cursor
  {
    "nvim-treesitter/playground",
    cmd = "TSCaptureUnderCursor",
    config = function()
      require("nvim-treesitter.configs").setup()
    end,
  },

  -- dim inactive windows
  {
    "andreadev-it/shade.nvim",
    keys = "<Bslash>",
    config = function()
      require("shade").setup {
        exclude_filetypes = { "NvimTree" },
      }
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require("trouble").setup()
    end,
  },

  {
    "elkowar/yuck.vim",
    config = function()
      vim.opt.ft = "yuck"
    end,
  },

  -- Lua
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "configs.zenmode"
    end,
  },
  {
    "NvChad/nvterm",
    opts = {
      terminals = {
        type_opts = {
          float = {
            width = 1,
            border = "single",
          },
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = "nvim-telescope/telescope-live-grep-args.nvim",
    opts = require "configs.telescope",
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
        "leoluz/nvim-dap-go",
      },
    },
    keys = {
      {
        "<S-F1>",
        function()
          require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
        end,
        desc = "Breakpoint Condition",
      },
      {
        "<F1>",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<F2>",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<F3>",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<F4>",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<F6>",
        function()
          require("dap").pause()
        end,
        desc = "Pause",
      },
      {
        "<F8>",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
      {
        "<F7>",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Widgets",
      },
    },
    config = function()
      require "configs.dap"
    end,
  },
}
