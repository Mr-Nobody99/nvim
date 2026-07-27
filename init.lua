require("vim._core.ui2").enable({})

require("autocmd")
require("options")
require("keymaps")

-- load plugins
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath("config"), "lua", "plugins")
for file_name, file_type in vim.fs.dir(plugins_dir, { follow = true }) do
	if (file_type == "file" or type == "link") and file_name:match("%.lua$") and file_name ~= "init.lua" then
		local mod = file_name:gsub("%.lua$", "")
		require("plugins." .. mod)
	end
end
