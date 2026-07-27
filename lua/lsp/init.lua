local lsp_dir = vim.fs.joinpath(vim.fn.stdpath("config"), "lua", "lsp")
for file_name, file_type in vim.fs.dir(lsp_dir, { follow = true }) do
	local is_file_or_link = (file_type == "file" or file_type == "link")
	local is_lua_not_init = file_name:match("%.lua$") and file_name ~= "init.lua"
	if is_file_or_link and is_lua_not_init then
		require("lsp." .. file_name:gsub("%.lua$", ""))
	end
end
