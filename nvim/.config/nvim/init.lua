_G.Config = {}

-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = { "git", "clone", "--filter=blob:none", "https://github.com/echasnovski/mini.nvim", mini_path }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.nvim | helptags ALL")
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps'
require("mini.deps").setup({ path = { package = path_package } })

-- Define helpers
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local cmd = function(cmd) return function() vim.cmd(cmd) end end
local load = function(spec, opts)
  return function()
    opts = opts or {}
    local slash = string.find(spec, "/[^/]*$") or 0
    local name = opts.init or string.sub(spec, slash + 1)
    if slash ~= 0 then
      add(vim.tbl_deep_extend("force", { source = spec }, opts.add or {}))
    end
    require(name)
    if opts.setup then require(name).setup(opts.setup) end
  end
end

-- Settings and mappings
now(load("settings"))
now(load("mappings"))
now(load("autocmds"))

-- Mini.nvim
add({ name = "mini.nvim" })
now(load("EdenEast/nightfox.nvim", { add = { name = "nightfox" }, init = "plugins.nightfox" }))
now(cmd("colorscheme nightfox"))

now(load("plugins.mini.basics"))
now(load("plugins.mini.files"))
now(load("plugins.mini.icons"))
now(load("plugins.mini.sessions"))
now(load("plugins.mini.starter"))
now(load("plugins.mini.statusline"))

later(load("plugins.mini.ai"))
later(load("plugins.mini.clue"))
later(load("plugins.mini.diff"))
later(load("plugins.mini.git"))
later(load("plugins.mini.hipatterns"))
later(load("plugins.mini.indentscope"))
later(load("plugins.mini.jump2d"))
later(load("plugins.mini.map"))
later(load("plugins.mini.misc"))
later(load("plugins.mini.notify"))
later(load("plugins.mini.pick"))
later(load("plugins.mini.surround"))

later(load("mini.align", { setup = {} }))
-- later(load("mini.animate",    { setup = {} }))
later(load("mini.bracketed", { setup = {} }))
later(load("mini.bufremove", { setup = {} }))
later(load("mini.colors", { setup = {} }))
later(load("mini.comment", { setup = {} }))
later(load("mini.cursorword", { setup = {} }))
-- later(load("plugins.mini.completion"))
later(load("mini.extra", { setup = {} }))
later(load("mini.jump", { setup = {} }))
later(load("mini.move", { setup = {} }))
later(load("mini.operators", { setup = {} }))
-- later(load("mini.pairs", { setup = {} }))
later(load("mini.splitjoin", { setup = {} }))
--later(load("mini.tabline", { setup = {} }))
--later(load("mini.trailspace", { setup = {} }))
--later(load("mini.visits", { setup = {} }))

-- Other plugins
later(load("windwp/nvim-autopairs", { setup = {} }))
later(load("zk-org/zk-nvim", { init = "plugins.zk" }))

later(load("nvim-treesitter/nvim-treesitter", {
  init = "plugins.treesitter",
  add = { hooks = { post_checkout = cmd("TSUpdate") } },
}))
later(function() add("nvim-treesitter/nvim-treesitter-textobjects") end)

later(load("nvim-treesitter/nvim-treesitter-context", {
  init = "treesitter-context",
  setup = {},
}))

later(load("neovim/nvim-lspconfig", {
  init = "plugins.lspconfig",
  add = {
    depends = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "folke/lazydev.nvim"
    },
  },
}))
