vim.api.nvim_create_augroup("AUTOCMD", { clear = true })

-- Center screen on Insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
    group = "AUTOCMD",
    pattern = { "*" },
    command = "norm zz",
})

-- Remove extra whitespace before writing to file
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "AUTOCMD",
    pattern = { "*" },
    command = [[:%s/\s\+$//e]],
})
