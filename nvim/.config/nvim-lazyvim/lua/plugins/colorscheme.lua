return {
  -- "catppuccin-mocha.nvim",
  -- lazy = true,
  -- priority = 1000,
  -- opts = function()
  --   return {
  --     transparency = true,
  --   }
  -- end,
  {
    "xiyaowong/transparent.nvim",
    setup = {
      extra_groups = {
        "NormalFloat",
        "NvimTreeNormal",
      },
    },
  },
}
