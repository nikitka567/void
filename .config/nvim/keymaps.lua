local opts = { noremap = true, silent = true }
local set = vim.keymap.set


--buffers keymaps
set("n", "<A-c>", ":bdelete!<CR>", opts)
set("n", "<tab>", ":bnext<CR>", opts)
set("n", "<S-tab>", ":bprevious<CR>", opts)
set("n", "<A-tab>", "<cmd> enew <CR>", opts)

-- save and quit keymaps
set("n", "<A-w>", ":w<CR>", opts)
set("n", "<A-q>", ":q<CR>", opts)

-- fast move
set("n", "<C-j>", "10j", opts)
set("n", "<C-k>", "10k", opts)



-- move around windows
set("n", "<A-h>", "<C-w>h", opts)
set("n", "<A-j>", "<C-w>j", opts)
set("n", "<A-k>", "<C-w>k", opts)
set("n", "<A-l>", "<C-w>l", opts)

-- persistance
set("n", "<A-s>", function() require("persistence").load({ last = true }) end)
set("n", "<A-d>", function() require("persistence").select() end)

-- alpha
set("n", "<A-a>", ":Alpha<CR>", opts)

-- open terminal keymaps
OPEN_TERM_KEYMAP = [[<A-\>]]

-- fast commenting keymaps
set('n', '<A-/>', require('Comment.api').toggle.linewise.current, opts)
set('v', '<A-/>', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)

-- resize windows keymaps
set('n', '<Up>', ':resize -2<CR>', opts)
set('n', '<Down>', ':resize +2<CR>', opts)
set('n', '<Left>', ':vertical resize -2<CR>', opts)
set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- increment and decrement keymaps
set('n', '<A-=>', '<C-a>', opts) -- increment
set('n', '<A-->', '<C-x>', opts) -- decrement

-- eto ya pisal keymaps
set('n', '<A-b>', '<C-w>v', opts) -- split window vertically
set('n', '<A-n>', '<C-w>s', opts) -- split window horizontally

-- neo-tree keymaps
set("n", "<A-e>", ":Neotree toggle<CR>", opts)

-- cmp keymaps
local cmp = require'cmp'

function CMP_KEYMAPS()
  return cmp.mapping.preset.insert({
 -- ['<C-Space>'] = cmp.mapping.complete(),
  -- ['<>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ['<Tab>'] = cmp.mapping(function(fallback)
	  local col = vim.fn.col('.') - 1
	  if cmp.visible() then
		cmp.select_next_item(select_opts)
	  elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
		fallback()
	  else
		cmp.complete()
	  end
  end, {'i', 's'}),
  ['<S-Tab>'] = cmp.mapping(function(fallback)
	  if cmp.visible() then
		cmp.select_prev_item(select_opts)
	  else
		fallback()
	  end
  end, {'i', 's'}), })
end
