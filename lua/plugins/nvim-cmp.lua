return {
  {
    { -- Autocompletion
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      enabled = true,
      dependencies = {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
      },
      config = function()
        local cmp = require("cmp")
        cmp.setup({
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          },
          completion = { completeopt = "menu,menuone,noinsert" },

          mapping = cmp.mapping.preset.insert({
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-p>"] = cmp.mapping.select_prev_item(),

            -- Scroll the documentation window [b]ack / [f]orward
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),

            -- Accept ([y]es) the completion.
            ["<C-y>"] = cmp.mapping.confirm({ select = true }),
            -- If you prefer more traditional completion keymaps,
            -- you can uncomment the following lines
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            -- ['<Tab>'] = cmp.mapping.select_next_item(),
            --['<S-Tab>'] = cmp.mapping.select_prev_item(),

            -- Manually trigger a completion from nvim-cmp.
            --  Generally you don't need this, because nvim-cmp will display
            --  completions whenever it has completion options available.
            -- ["<C-Space>"] = cmp.mapping.complete({}),
          }),
          sources = {
            { name = "path" },
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "cmdline" },
          },
        })
      end,
    },
  },
}
