return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- Language servers
        "pyright",
        "ruff-lsp",
        "typescript-language-server",
        "gopls",
        "rust-analyzer",
        "jdtls",
        "tailwindcss-language-server",
        "css-lsp",
        "html-lsp",
        "json-lsp",
        "dockerfile-language-server",
        "marksman",
        
        -- Formatters
        "black",
        "isort",
        "prettier",
        "gofumpt",
        "goimports",
        "rustfmt",
        "google-java-format",
        
        -- Linters
        "eslint_d",
        "golangci-lint",
        "pylint",
        "flake8",
        "mypy",
        
        -- Debug adapters
        "debugpy",
        "delve",
        "js-debug-adapter",
        
        -- Additional tools
        "shfmt",
        "shellcheck",
        "hadolint", -- Docker linter
      },
    },
  },
}