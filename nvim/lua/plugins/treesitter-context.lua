return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "LazyFile",
  opts = {

    mode = "cursor", -- Line used to calculate context. Can be 'cursor' or 'topline'
    max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
    min_rows = 0, -- Minimum number of lines in the file for the context window to appear.
  },
  keys = {
    {
      "[c",
      function()
        require("treesitter-context").go_to_context(vim.v.count1)
      end,
      desc = "Jump to upper context",
    },
  },
}
