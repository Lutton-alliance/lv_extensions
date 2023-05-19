Citizen.CreateThread( function()
	updatePath = "/Lutton-alliance/lv_extensions" -- your git user/repo path
	resourceName = "lv_extensions ("..GetCurrentResourceName()..")" -- the resource name
	
	function checkVersion(err,responseText, headers)
		curVersion = LoadResourceFile(GetCurrentResourceName(), "version") -- make sure the "version" file actually exists in your resource root!
	
		if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
			print("\n###############################")
			print("\n"..resourceName.." is outdated, should be:\n"..responseText.."is:\n"..curVersion.."\nplease update it from https://github.com"..updatePath.."")
			print("\n###############################")
		elseif tonumber(curVersion) > tonumber(responseText) then
			print("New extensions have been added to "..resourceName.." , the current version may not be compatible with the latest Las Venturas update!")
		else
			print("\n"..resourceName.." is up to date.")
		end
	end
	
	PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/master/version", checkVersion, "GET")
	end)