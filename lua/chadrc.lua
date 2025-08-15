---@type ChadrcConfig
local M = {}

M = {
  base46 = {
    theme = "tokyodark",
    transparency = true,
    --   hl_override = {
    --     Comment = { italic = true },
    --     ["@comment"] = { italic = true },
    --     Visual = {
    --       bg = { "grey", 2 },
    --     },
    --   },
  },
  nvdash = {
    load_on_startup = true,
  },
  term = {
    float = {
      relative = "editor",
      row = 0.2,
      col = 0.15,
      width = 0.7,
      height = 0.5,
      border = "single",
    },
  },
  ui = {
    statusline = { theme = "vscode_colored", separator_style = "round" },
    cmp = {
      icons_left = true,
    },
    telescope = {
      style = "bordered",
    },

    tabufline = {
      transparency = true,
      order = { "buffers", "tabs", "treeOffset", "btns" },
    },
  },
}
return M
