return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        goimports = "gopls",
        gofmt = "gofumpt",
        max_line_len = 120,
        
        tag_transform = false,
        tag_options = "json=omitempty",
        
        gotests = {
          template = "",
          template_dir = "",
        },
        
        comment_placeholder = "   ",
        icons = { breakpoint = "🟥", currentpos = "🟢" },
        verbose = false,
        lsp_cfg = false,
        lsp_gofumpt = true,
        lsp_on_attach = nil,
        dap_debug = true,
        dap_debug_keymap = true,
        dap_debug_gui = {},
        dap_debug_vt = { enabled_commands = true, all_frames = true },
        
        textobjects = true,
        test_runner = "go",
        verbose_tests = true,
        run_in_floaterm = false,
        floaterm = {
          posititon = "auto",
          width = 0.45,
          height = 0.98,
        },
        trouble = true,
        test_efm = false,
        luasnip = true,
      })
      
      -- Run gofmt + goimports on save
      local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require("go.format").goimports()
        end,
        group = format_sync_grp,
      })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
  },
}