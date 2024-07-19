local telescope = require("telescope")
telescope.setup {
    defaults = {
        file_ignore_patterns = { ".git/", ".cache/", "target/", "dist/", ".iso", ".bin", ".fls", ".aux", ".fdb_latexmk", ".toc", ".synctex.gz", ".pdf", ".log", ".dvi" }
    },
    extensions = {
        file_browser = {
            hidden = true
        }
    }
}
telescope.load_extension("file_browser")
telescope.load_extension("projects")
