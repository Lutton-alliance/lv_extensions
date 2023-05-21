Citizen.CreateThread( function()
	updatePath = "/Lutton-alliance/lv_extensions"
	resourceName = "lv_extensions ("..GetCurrentResourceName()..")"
	
	function checkVersion(err,responseText, headers)
		curVersion = LoadResourceFile(GetCurrentResourceName(), "version")
	
		if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
			print("\n###############################")
			print("\n"..resourceName.." is outdated\nIt should be version: "..responseText.."It is currently version: "..curVersion.."\nplease update it from https://github.com"..updatePath.."")
			print("\n###############################")
		elseif tonumber(curVersion) > tonumber(responseText) then
			print("New extensions have been added to "..resourceName.." , the current version may not be compatible with the latest Las Venturas update!")
		else
			print("\n"..resourceName.." is up to date.")
		end
	end
	
	PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/master/version", checkVersion, "GET")
	end)
