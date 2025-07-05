vim.g.mapleader = " "

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"
vim.opt.mouse = ""
vim.opt.showtabline = 0

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

vim.opt.hidden = true -- Allow background buffers
vim.opt.showtabline = 0 -- No tab bar

-- Lighter line numbers configuration
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		-- Make line numbers lighter/more subtle
		vim.cmd([[
      highlight LineNr guifg=#565f89 ctermfg=242
      highlight CursorLineNr guifg=#7aa2f7 ctermfg=75 gui=bold
      highlight SignColumn guibg=NONE ctermbg=NONE
    ]])
	end,
})

-- Apply immediately if colorscheme is already loaded
vim.defer_fn(function()
	vim.cmd([[
    highlight LineNr guifg=#565f89 ctermfg=242
    highlight CursorLineNr guifg=#7aa2f7 ctermfg=75 gui=bold
    highlight SignColumn guibg=NONE ctermbg=NONE
  ]])
end, 100)
