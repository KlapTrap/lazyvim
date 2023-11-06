return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        angularls = function(_, opts)
          opts.root_dir = require("lspconfig.util").root_pattern("angular.json", "project.json")
        end,
      },
    },
  },
}
