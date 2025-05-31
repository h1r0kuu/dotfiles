return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- Python
        python = { "flake8", "mypy" },
        
        -- JavaScript/TypeScript
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        
        -- Go
        go = { "golangci-lint" },
        
        -- Docker
        dockerfile = { "hadolint" },
        
        -- Shell
        sh = { "shellcheck" },
        bash = { "shellcheck" },
        
        -- Markdown
        markdown = { "markdownlint" },
        
        -- JSON
        json = { "jsonlint" },
        
        -- YAML
        yaml = { "yamllint" },
      },
      linters = {
        eslint_d = {
          args = {
            "--no-warn-ignored",
            "--format",
            "json",
            "--stdin",
            "--stdin-filename",
            function()
              return vim.api.nvim_buf_get_name(0)
            end,
          },
        },
        flake8 = {
          args = {
            "--format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s",
            "--no-show-source",
            "--stdin-display-name",
            function()
              return vim.api.nvim_buf_get_name(0)
            end,
            "-",
          },
        },
        mypy = {
          args = {
            "--show-column-numbers",
            "--show-error-end",
            "--hide-error-codes",
            "--hide-error-context",
            "--no-color-output",
            "--no-error-summary",
            "--no-pretty",
            function()
              return vim.api.nvim_buf_get_name(0)
            end,
          },
        },
        golangci_lint = {
          args = {
            "run",
            "--out-format",
            "json",
            "--issues-exit-code=1",
            function()
              return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
            end,
          },
        },
        hadolint = {
          args = { "--format", "json", "-" },
        },
        markdownlint = {
          args = { "--stdin", "--json" },
        },
      },
    },
    config = function(_, opts)
      local lint = require("lint")
      
      for name, linter in pairs(opts.linters or {}) do
        if type(linter) == "table" and type(lint.linters[name]) == "table" then
          lint.linters[name] = vim.tbl_deep_extend("force", lint.linters[name], linter)
        else
          lint.linters[name] = linter
        end
      end
      
      lint.linters_by_ft = opts.linters_by_ft
      
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}