return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Python
        python = { "black", "isort" },
        
        -- JavaScript/TypeScript/React
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        
        -- Go
        go = { "gofumpt", "goimports" },
        
        -- Rust
        rust = { "rustfmt" },
        
        -- Java
        java = { "google-java-format" },
        
        -- Web technologies
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        
        -- Markdown
        markdown = { "prettier" },
        
        -- Docker
        dockerfile = {},
        
        -- Shell
        sh = { "shfmt" },
        bash = { "shfmt" },
        
        -- YAML
        yaml = { "prettier" },
        
        -- TOML
        toml = {},
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters = {
        black = {
          prepend_args = { "--fast", "--line-length", "88" },
        },
        prettier = {
          prepend_args = { "--tab-width", "2", "--single-quote" },
        },
        rustfmt = {
          prepend_args = { "--edition", "2021" },
        },
      },
    },
  },
}