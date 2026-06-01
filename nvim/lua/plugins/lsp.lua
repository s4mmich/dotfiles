return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- This ensures lspconfig knows how to configure lua_ls
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                -- Tell lua_ls where to find your custom stubs
                library = {
                  -- This dynamically finds your nvim config directory and appends the stub path
                  vim.fn.stdpath("config") .. "/lua/stubs",
                },
                -- Prevents the server from scanning huge directories unnecessarily
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          },
        },
      },
    },
  },
}
