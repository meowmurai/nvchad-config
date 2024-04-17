---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "tokyodark",
  nvdash = {
    load_on_startup = true,
  },
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    Visual = {
      bg = { "grey", 2 },
    },
  },
  telescope = {
    style = "bordered",
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
  tabufline = {
    order = { "buffers", "tabs", "treeOffset", "btns" },
  },
  -- transparency = true,
}
return M
