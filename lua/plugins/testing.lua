return {
  { "nvim-neotest/neotest-plenary" },
  { "haydenmeade/neotest-jest" },
  {
    "nvim-neotest/neotest",
    opts = {
      status = { virtual_text = true },
      output = { open_on_run = true },
      adapters = {
        "neotest-plenary",
        ["neotest-jest"] = {
          env = { CI = true },
          jestConfigFile = function()
            local file = vim.fn.expand("%:p")
            if string.find(file, "/libs/") then
              return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
            end
            return vim.fn.getcwd() .. "/jest.config.ts"
          end,
          cwd = function()
            local file = vim.fn.expand("%:p")
            if string.find(file, "/libs/") then
              return string.match(file, "(.-/[^/]+/)src")
            end
            return vim.fn.getcwd()
          end,
        },
      },
    },
  },

  -- {
  --   "vim-test/vim-test",
  --   config = function()
  --     vim.cmd([[
  --       let g:test#javascript#runner = 'jest'
  --       let test#neovim#term_position = 'split-below'
  --     ]])
  --   end,
  --   keys = {
  --     { "<leader>tt", "<cmd>TestNearest<cr>" },
  --     { "<leader>tT", "<cmd>TestFile<cr>" },
  --   },
  -- },
}
