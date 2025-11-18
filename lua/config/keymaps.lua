-- keymaps are automatically loaded on the verylazy event
-- default keymaps that are always set: https://github.com/lazyvim/lazyvim/blob/main/lua/lazyvim/config/keymaps.lua
-- add any additional keymaps here
local keymap = vim.keymap -- Alias for easier usage
local opts = { noremap = true, silent = true } -- Prevent recursive mapping & disable command echo

-- local discipline = require("custom.discipline")
-- discipline.cowboy()

keymap.set("n", "<leader>tt", require("custom.float_terminal").open_floating_term, { desc = "Open floating terminal" })

-- =========================
-- INCREMENT & DECREMENT
-- =========================
keymap.set("n", "+", "<C-a>", opts) -- Increase the number under the cursor
keymap.set("n", "-", "<C-x>", opts) -- Decrease the number under the cursor

-- =========================
-- DELETE OPERATIONS
-- =========================
keymap.set("n", "dw", "vb_d", opts) -- Delete a word backward (visual back + delete)

-- =========================
-- TEXT SELECTION
-- =========================
keymap.set("n", "<C-a>", "gg<S-v>G", opts) -- Select all text in the file (gg -> go to start, <S-v>G -> visual select to end)

-- =========================
-- JUMP LIST NAVIGATION
-- =========================
keymap.set("n", "<C-m>", "<C-i>", opts) -- Move forward in the jump list (same as `<C-o>` but forward)

-- =========================
-- TAB MANAGEMENT
-- =========================
-- keymap.set("n", "te", ":tabedit<Return>", opts) -- Open a new tab
-- keymap.set("n", "<Tab>", ":tabnext<Return>", opts) -- Switch to the next tab
-- keymap.set("n", "<S-Tab>", ":tabprev<Return>", opts) -- Switch to the previous tab

-- =========================
-- CLOSE ACTIVE TAB (ALT + SHIFT + W)
-- =========================
keymap.set("n", "<A-S-w>", ":bd<Return>", opts)

-- =========================
-- SWITCH BETWEEN BUFFERS
-- =========================
keymap.set("n", "<A-S-,>", ":bprevious<Return>", opts)
keymap.set("n", "<A-S-.>", ":bnext<Return>", opts)

-- =========================
-- SPLIT WINDOWS
-- =========================
keymap.set("n", "ss", ":split<Return>", opts) -- Create a horizontal split
keymap.set("n", "sv", ":vsplit<Return>", opts) -- Create a vertical split

-- =========================
-- MOVE BETWEEN WINDOWS
-- =========================
keymap.set("n", "<A-S-Left>", "<C-w>h", opts) -- Move to the left window
keymap.set("n", "<A-S-Up>", "<C-w>k", opts) -- Move to the top window
keymap.set("n", "<A-S-Down>", "<C-w>j", opts) -- Move to the bottom window
keymap.set("n", "<A-S-Rigth>", "<C-w>l", opts) -- Move to the right window

-- =========================
-- CLOSE ACTIVE SPLIT WINDOW
-- =========================
keymap.set("n", "<A-S-q>", ":close<Return>", opts) -- Close the current split window

-- =========================
-- RESIZE WINDOWS
-- =========================
keymap.set("n", "<C-w><Left>", "<C-w><", opts) -- Shrink window horizontally
keymap.set("n", "<C-w><Right>", "<C-w>>", opts) -- Expand window horizontally
keymap.set("n", "<C-w><Up>", "<C-w>+", opts) -- Increase window height
keymap.set("n", "<C-w><Down>", "<C-w>-", opts) -- Decrease window height

-- =========================
-- COPY AND PAST CURRENT LINE (ABOVE OR BELOW)
-- =========================
keymap.set("n", "<A-S-Up>", "yyp", opts)
keymap.set("n", "<A-S-Down>", "yyP", opts)

-- =========================
-- SAVE WITHOUT FORMATTING
-- =========================
keymap.set("n", "<C-w>", ":noautocmd w<Return>", opts)
