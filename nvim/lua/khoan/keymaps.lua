-- clear highlights on search when pressing <esc> in normal mode and exit terminal
vim.keymap.set("n", "<esc>", vim.cmd.nohlsearch)
vim.keymap.set("n", "-", vim.cmd.Explore)
-- use ctrl+<hjkl> to switch between windows
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")
-- use arrow keys for resize
vim.keymap.set("n", "<up>", function()
    vim.cmd.resize("+5")
end)
vim.keymap.set("n", "<down>", function()
    vim.cmd.resize("-5")
end)
vim.keymap.set("n", "<left>", function()
    vim.cmd.resize({
        args = { "-5" },
        mods = { vertical = true }
    })
end)
vim.keymap.set("n", "<right>", function()
    vim.cmd.resize({
        args = { "+5" },
        mods = { vertical = true }
    })
end)
-- command mode navigation
vim.keymap.set("c", "<c-a>", "<home>")
vim.keymap.set("c", "<c-e>", "<end>")
-- navigate through quickfix list
vim.keymap.set("n", "]q", vim.cmd.cnext)
vim.keymap.set("n", "[q", vim.cmd.cprevious)
-- navigate through loclist
vim.keymap.set("n", "]l", vim.cmd.lnext)
vim.keymap.set("n", "[l", vim.cmd.lprevious)
-- navigate through buffer
vim.keymap.set("n", "]b", vim.cmd.bnext)
vim.keymap.set("n", "[b", vim.cmd.bprevious)
-- search current marked text
vim.keymap.set("v", "//", [[y/\v<c-r>=escape(@",'/\')<cr><cr>]])
-- yank marked text/paste to/from global register
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("v", "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>p", [["+p]])
vim.keymap.set("v", "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])
-- search and replace
vim.keymap.set("n", "<leader>rr", [[:%s/<c-r><c-w>//g<left><left>]])
vim.keymap.set("v", "<leader>rr", [["5y:%s/<c-r>5//g<left><left>]])
-- unix commands
vim.keymap.set("n", "<leader>cp", [[:!cp -r %:.<c-z> %:h<c-z>]])
vim.keymap.set("n", "<leader>mv", [[:!mv %:.<c-z> %:h<c-z>]])
vim.keymap.set("n", "<leader>rm", [[:!rm -rf %:.<c-z>]])
-- default fuzzy find
vim.keymap.set("n", "<leader>f", [[:find **/*]])
vim.keymap.set("n", "<leader>e", [[:e %:h<c-z>]])
vim.keymap.set("n", "<leader>b", [[:b <c-z>]])
vim.keymap.set("n", "<leader>ju", vim.cmd.jumps)
vim.keymap.set("n", "<leader>mm", vim.cmd.marks)
-- default grep
if vim.fn.executable("rg") > 0 then
    vim.keymap.set("n", "<leader>gg", [[:silent grep! ''<left>]])
    vim.keymap.set("v", "<leader>gg", [["0y:silent grep! --case-sensitive '<c-r>0'<left>]])
    vim.keymap.set("n", "<leader>gw", [[:silent grep! --case-sensitive '<c-r><c-w>'<cr>]])
    vim.keymap.set("n", "<leader>/", [[:silent grep! --hidden --no-ignore ''<left>]])
end
-- diff mode
vim.keymap.set("n", "<leader>du", function()
    vim.cmd.diffget("//3")
end)
vim.keymap.set("n", "<leader>dh", function()
    vim.cmd.diffget("//2")
end)
-- vsplit on gf
vim.keymap.set("n", "gf", "<cmd>vertical wincmd f<cr>")
-- set global mark before gd/#/*
vim.keymap.set("n", "gd", "mMgd")
vim.keymap.set("n", "#", "mM#")
vim.keymap.set("n", "*", "mM*")
-- run ctags in the background
vim.keymap.set("n", "<leader>tg", function()
    if vim.fn.executable("ctags") < 1 then
        print("no ctags installation found")
        return
    end
    local job = vim.fn.jobstart({ "ctags", "--tag-relative=never", "-G", "-R", "." })
    print("generate tags..., id: " .. job)
end)
