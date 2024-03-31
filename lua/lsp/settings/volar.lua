local function get_typescript_server_path(root_dir)
	local global_ts = "C:/Users/Charles/AppData/Local/Yarn/Data/global/node_modules/@vue/typescript-plugin/lib"
	-- Alternative location if installed as root:
	local found_ts = ""
	local function check_dir(path)
		found_ts = util.path.join(path, "node_modules", "typescript", "lib")
		if util.path.exists(found_ts) then
			return path
		end
	end
	if util.search_ancestors(root_dir, check_dir) then
		return found_ts
	else
		return global_ts
	end
end

return {
	opts = {
		on_new_config = function(new_config, new_root_dir)
			new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
		end,
	},
}
