local options = {
  backup = false,                          -- Don't create backup files.
  clipboard = "unnamedplus",               -- Always use the system clipboard.
  cmdheight = 2,                           -- More space in the cmd prompt.
  completeopt = { "menuone", "noselect" }, -- Completion settings, always show a popup menu and force a selection.
  conceallevel = 0,                        -- Show all text as normal, don't conceal anything.
  cursorline = true,                       -- Highlight the current line in some way.
  cursorlineopt = "both",                  -- Hightlight both the current line and the line number.
  expandtab = true,                        -- Convert tabs to spaces.
  fileencoding = "utf-8",                  -- Encoding.
  guifont = "monospace:h17",               -- The font used for GUI vim.
  hlsearch = true,                         -- Highlight all search matches.
  ignorecase = true,                       -- Ignore case when searching.
  mouse = "a",                             -- Allow mouse usage in all modes.
  number = true,                           -- Show line numbers.
  numberwidth = 4,                         -- Line number column width.
  pumheight = 10,                          -- Maxiumum number of items to show in popup menus.
  relativenumber = false,                  -- Absolute line numbers.
  scrolloff = 8,                           -- Number of lines to how below/above the cursor when scrolling.
  shiftwidth = 2,                          -- Indentation amount in spaces.
  showmode = false,                        -- Don't show the mode we're in at the bottom.
  showtabline = 2,                         -- Always show tabs at the top.
  sidescrolloff = 8,                       -- Number of characters to keep on either side of the cursor horizontally.
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  tabstop = 2,                             -- insert 2 spaces for a tab
  timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  whichwrap = "<,>,[,],h,l",
  wrap = false,                            -- display lines as one long line
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

--vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
