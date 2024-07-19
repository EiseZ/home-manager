local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd [[ packadd packer.nvim ]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use { "catppuccin/nvim", as = "catppuccin" }

    use { "ahmedkhalf/project.nvim", config = function() require("plugins/project") end }
    use { "nvim-lua/plenary.nvim", command = { "Telescope" } }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make", command = { "Telescope" } }
    use { "nvim-telescope/telescope-file-browser.nvim", command = { "Telescope" } }
    use { "nvim-telescope/telescope.nvim", command = { "Telescope" }, config = function() require("plugins/telescope") end }

    use { "hrsh7th/cmp-buffer", event = "InsertEnter" }
    use { "hrsh7th/cmp-path", event = "InsertEnter" }
    use { "hrsh7th/cmp-cmdline", event = "InsertEnter" }
    use { "L3MON4D3/LuaSnip", event = "InsertEnter", config = function() require("snippets")  end }
    use { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "neovim/nvim-lspconfig", event = "InsertEnter", config = function() require("plugins/nvim-lspconfig") end }
    use { "hrsh7th/nvim-cmp", event = "InsertEnter", config = function() require("plugins/nvim-cmp") end }

    use "ap/vim-css-color"
    use { "brenoprata10/nvim-highlight-colors", config = function() require("nvim-highlight-colors").setup({}) end }
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use { "numToStr/Comment.nvim", event = "InsertEnter", config = function() require("Comment").setup() end }

    -- use "bluz71/vim-mistfly-statusline"

    use { "liuchengxu/vim-which-key", command = { "WhichKey", "WhichKey!" } }

    use { "ggandor/leap.nvim", event = "InsertEnter", config = function() require("leap").add_default_mappings(true) end }

    use { "lewis6991/impatient.nvim", config = function() require("impatient") end }

    use { "lervag/vimtex", ft = "tex", config = function() require("plugins/vimtex") end }

    if packer_bootstrap then
        require("packer").sync()
    end
end)

