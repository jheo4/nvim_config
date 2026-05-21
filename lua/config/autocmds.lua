-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_user_command("RenameIdentifier", function()
  vim.lsp.buf.rename()
end, {})

-- Custom keymaps to apply when an LSP client attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local keymap = vim.keymap
    local opts = { buffer = ev.buf, silent = true }

    -- =========================================================================
    -- [1] Telescope Integrations (Popups with search and navigation)
    -- =========================================================================

    -- gR: Show all references of the symbol under cursor across the project
    opts.desc = "Show LSP references"
    keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

    -- gd: Go to the definition of the symbol under cursor
    opts.desc = "Show LSP definitions"
    keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

    -- gi: Go to the implementation of the interface/virtual function
    opts.desc = "Show LSP implementations"
    keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

    -- gt: Go to the type definition of the symbol under cursor
    opts.desc = "Show LSP type definitions"
    keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

    -- <leader>D: Show all diagnostics (errors/warnings) for the current buffer
    opts.desc = "Show buffer diagnostics"
    keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

    -- =========================================================================
    -- [2] Built-in Neovim LSP Functions (Fast and direct core actions)
    -- =========================================================================

    -- gD: Go to the declaration of the symbol (e.g., in C++ header files)
    opts.desc = "Go to declaration"
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    -- <leader>ca: See available code actions / quick fixes under cursor (Works in Visual mode too)
    opts.desc = "See available code actions"
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    -- <leader>rn: Smart rename all instances of the symbol across the project
    opts.desc = "Smart rename"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    -- <leader>d: Show detailed diagnostic message for the current line in a floating window
    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

    -- K: Show documentation/hover information for the symbol under cursor
    opts.desc = "Show documentation"
    keymap.set("n", "K", vim.lsp.buf.hover, opts)

    -- <leader>rs: Restart the LSP server if it becomes laggy or unresponsive
    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
  end,
})
