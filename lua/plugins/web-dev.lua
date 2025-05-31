return {
  -- TypeScript/React utilities
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        separate_diagnostic_server = true,
        publish_diagnostic_on = "insert_leave",
        expose_as_code_action = {},
        tsserver_path = nil,
        tsserver_plugins = {},
        tsserver_max_memory = "auto",
        tsserver_format_options = {},
        tsserver_file_preferences = {},
        tsserver_locale = "en",
        complete_function_calls = false,
        include_completions_with_insert_text = true,
        code_lens = "off",
        disable_member_code_lens = true,
        jsx_close_tag = {
          enable = false,
          filetypes = { "javascriptreact", "typescriptreact" },
        },
      },
    },
  },
  
  -- Tailwind CSS IntelliSense
  {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      document_color = {
        enabled = true,
        kind = "inline",
        inline_symbol = "󰝤 ",
        debounce = 200,
      },
      conceal = {
        enabled = false,
        min_length = nil, 
        symbol = "'",
        highlight = {
          fg = "#38BDF8",
        },
      },
      custom_filetypes = {}, -- see the extension section to learn how it works
    },
  },
  
  -- Auto close and rename HTML tags
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "vue", "tsx", "jsx", "rescript", "xml", "php", "markdown", "astro", "glimmer", "handlebars", "hbs" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  
  -- CSS color highlighting
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue or blue
        RRGGBBAA = false, -- #RRGGBBAA hex codes
        AARRGGBB = true, -- 0xAARRGGBB hex codes
        rgb_fn = false, -- CSS rgb() and rgba() functions
        hsl_fn = false, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        mode = "background", -- Set the display mode.
        tailwind = true, -- Enable tailwind colors
        sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
        virtualtext = "■",
        always_update = false,
      },
      buftypes = {},
    },
  },
  
  -- Package.json management
  {
    "vuki656/package-info.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    opts = {},
    event = { "BufRead package.json" },
  },
  
  -- React/JSX snippets and utilities
  {
    "dsznajder/vscode-es7-javascript-react-snippets",
    build = "yarn install --frozen-lockfile && yarn compile",
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  },
}