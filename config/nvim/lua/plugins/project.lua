local project = require("project_nvim")
project.setup({
    exclude_dirs = { "~/.cargo" },
    detection_methods = { "pattern", "lsp" },
    -- ignore_lsp = { "sumneko_lua" },
    show_hidden = true,
    silent_chdir = false,
    datapath = vim.fn.stdpath("data"),
    patterns = { "!=lua",
                 ">latex", ">rust", ">web", ">python", ">haskell", ">c", ">cpp", ">julia", ">other",
                 ">forks", ">.config",
                 "=pws-code",
               },
})
