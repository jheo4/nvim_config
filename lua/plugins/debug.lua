-- This file is for debugging purposes. It can be used to disable plugins or make other temporary changes without affecting the main configuration.
-- On Mac, command renderer (noice) crashes nvim. This is a temporary workaround to disable it until a fix is found - 03-04-2026
return {
  {
    "folke/noice.nvim",
    enabled = false,
  },
}
