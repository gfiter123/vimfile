-- switch
return {
  "AndrewRadev/switch.vim",
  cmd = "Switch",
    -- stylua: ignore
    keys = {
      { ";s", "<cmd>Switch<CR>" },
    },
  config = function()
    -- 反义单词组
    local switch_words = {
      { "true", "false" },
      { "on", "off" },
      { "yes", "no" },
      { "up", "down" },
      { "push", "pop" },
      { ".", "->" },
      { "disable", "enable" },
      { "+", "-" },
      { ">", "<" },
      { ">=", "<=" },
      { "==", "!=" },
      { "&&", "||" },
    }

    -- 反义单词容器
    local push_words = {}

    for _, value in pairs(switch_words) do
      local w1, w2 = value[1], value[2]
      -- 全小写
      table.insert(push_words, value)
      -- 全大写
      table.insert(push_words, { string.upper(w1), string.upper(w2) })
      -- 首字母大写
      w1, _ = string.gsub(w1, "^%l", string.upper)
      w2, _ = string.gsub(w2, "^%l", string.upper)
      table.insert(push_words, { w1, w2 })
    end

    vim.g.switch_custom_definitions = push_words
  end,
}
