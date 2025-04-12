local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  -- Attach default mappings
  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', '.', function()
    local node = api.tree.get_node_under_cursor()
    local path = node.absolute_path
    local codecompanion = require("codecompanion")
    local chat = codecompanion.last_chat()
    --if no chat, create one
    if (chat == nil) then
      chat = codecompanion.chat()
    end
    -- if already added, ignore
    for _, ref in ipairs(chat.refs) do
      if ref.path == path then
        return print("Already added")
      end
    end
    chat.references:add({
      id = '<file>' .. path .. '</file>',
      path = path,
      source = "codecompanion.strategies.chat.slash_commands.file",
      opts = {
        pinned = true
      }
    })
  end, { buffer = bufnr, desc = "Add or Pin file to Chat" })
end

return {
    'nvim-tree/nvim-tree.lua',
    keys = {
        -- Define key bindings here
        { "<leader>o", ":NvimTreeToggle<CR>",  desc = "Toggle Nvim Tree" },
        { "<leader>r", ":NvimTreeRefresh<CR>", desc = "Refresh Nvim Tree" },
    },
    opts = {
        on_attach = on_attach
    }
}
