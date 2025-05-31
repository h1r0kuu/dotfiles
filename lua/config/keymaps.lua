-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Language-specific keymaps and commands
local map = vim.keymap.set

-- Python specific
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    map("n", "<leader>cr", "<cmd>!python %<cr>", { desc = "Run Python file", buffer = true })
    map("n", "<leader>ct", "<cmd>!python -m pytest<cr>", { desc = "Run Python tests", buffer = true })
  end,
})

-- Go specific
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    map("n", "<leader>cr", "<cmd>GoRun<cr>", { desc = "Go Run", buffer = true })
    map("n", "<leader>ct", "<cmd>GoTest<cr>", { desc = "Go Test", buffer = true })
    map("n", "<leader>cT", "<cmd>GoTestFile<cr>", { desc = "Go Test File", buffer = true })
    map("n", "<leader>cb", "<cmd>GoBuild<cr>", { desc = "Go Build", buffer = true })
    map("n", "<leader>ci", "<cmd>GoInstall<cr>", { desc = "Go Install", buffer = true })
    map("n", "<leader>cg", "<cmd>GoGenerate<cr>", { desc = "Go Generate", buffer = true })
    map("n", "<leader>cf", "<cmd>GoFillStruct<cr>", { desc = "Go Fill Struct", buffer = true })
    map("n", "<leader>ce", "<cmd>GoIfErr<cr>", { desc = "Go If Err", buffer = true })
  end,
})

-- Rust specific
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    map("n", "<leader>cr", "<cmd>RustLsp runnables<cr>", { desc = "Rust Runnables", buffer = true })
    map("n", "<leader>ct", "<cmd>RustLsp testables<cr>", { desc = "Rust Testables", buffer = true })
    map("n", "<leader>cb", "!cargo build<cr>", { desc = "Cargo Build", buffer = true })
    map("n", "<leader>cc", "!cargo check<cr>", { desc = "Cargo Check", buffer = true })
    map("n", "<leader>cC", "!cargo clippy<cr>", { desc = "Cargo Clippy", buffer = true })
    map("n", "<leader>cd", "<cmd>RustLsp debuggables<cr>", { desc = "Rust Debuggables", buffer = true })
    map("n", "<leader>ch", "<cmd>RustLsp hover actions<cr>", { desc = "Rust Hover Actions", buffer = true })
    map("n", "<leader>ce", "<cmd>RustLsp explainError<cr>", { desc = "Rust Explain Error", buffer = true })
    map("n", "<leader>co", "<cmd>RustLsp openCargo<cr>", { desc = "Open Cargo.toml", buffer = true })
  end,
})

-- Java specific
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    map("n", "<leader>cr", "<cmd>JavaRunnerRunMain<cr>", { desc = "Java Run Main", buffer = true })
    map("n", "<leader>ct", "<cmd>JavaRunnerRunTest<cr>", { desc = "Java Run Test", buffer = true })
    map("n", "<leader>cb", "<cmd>JavaBuildBuildWorkspace<cr>", { desc = "Java Build Workspace", buffer = true })
    map("n", "<leader>cc", "<cmd>JavaBuildCleanWorkspace<cr>", { desc = "Java Clean Workspace", buffer = true })
  end,
})

-- TypeScript/JavaScript specific
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  callback = function()
    map("n", "<leader>cr", "<cmd>!node %<cr>", { desc = "Run Node file", buffer = true })
    map("n", "<leader>ct", "<cmd>!npm test<cr>", { desc = "Run npm tests", buffer = true })
    map("n", "<leader>cb", "<cmd>!npm run build<cr>", { desc = "npm build", buffer = true })
    map("n", "<leader>cs", "<cmd>!npm start<cr>", { desc = "npm start", buffer = true })
    map("n", "<leader>cd", "<cmd>!npm run dev<cr>", { desc = "npm run dev", buffer = true })
    -- TypeScript specific
    if vim.bo.filetype == "typescript" or vim.bo.filetype == "typescriptreact" then
      map("n", "<leader>cT", "<cmd>TypescriptOrganizeImports<cr>", { desc = "Organize Imports", buffer = true })
      map("n", "<leader>cR", "<cmd>TypescriptRenameFile<cr>", { desc = "Rename File", buffer = true })
    end
  end,
})

-- Docker specific
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dockerfile",
  callback = function()
    map("n", "<leader>cb", "<cmd>!docker build -t temp-image .<cr>", { desc = "Docker Build", buffer = true })
    map("n", "<leader>cr", "<cmd>!docker run --rm temp-image<cr>", { desc = "Docker Run", buffer = true })
  end,
})

-- Markdown specific
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    map("n", "<leader>cp", "<cmd>MarkdownPreview<cr>", { desc = "Markdown Preview", buffer = true })
    map("n", "<leader>cs", "<cmd>MarkdownPreviewStop<cr>", { desc = "Stop Markdown Preview", buffer = true })
  end,
})

-- General development keymaps
map("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Float Terminal" })
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle Horizontal Terminal" })
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Toggle Vertical Terminal" })

-- Quick file operations
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save File" })
map("n", "<leader>fS", "<cmd>wa<cr>", { desc = "Save All Files" })

-- Testing shortcuts
map("n", "<leader>ta", "<cmd>TestSuite<cr>", { desc = "Test All" })
map("n", "<leader>tf", "<cmd>TestFile<cr>", { desc = "Test File" })
map("n", "<leader>tn", "<cmd>TestNearest<cr>", { desc = "Test Nearest" })
map("n", "<leader>tl", "<cmd>TestLast<cr>", { desc = "Test Last" })

-- Quick navigation
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
map("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })

-- Diagnostics
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open Diagnostic Float" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic Location List" })

-- Code actions
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format" })

-- Debugging
map("n", "<F5>", "<cmd>DapContinue<cr>", { desc = "Debug Continue" })
map("n", "<F8>", "<cmd>DapStepOver<cr>", { desc = "Debug Step Over" })
map("n", "<F9>", "<cmd>DapStepInto<cr>", { desc = "Debug Step Into" })
map("n", "<F10>", "<cmd>DapStepOut<cr>", { desc = "Debug Step Out" })
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle Breakpoint" })
map("n", "<leader>dr", "<cmd>DapRepl<cr>", { desc = "Debug Repl" })
map("n", "<leader>dl", "<cmd>DapRunLast<cr>", { desc = "Debug Run Last" })

