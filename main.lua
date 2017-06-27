local db = require(884443632) --I didn't use HttpService since HttpEnabled needs to be true and plugins can't access it (because somehow plugins can't access LocalUserSecurities but a command bar can)

local function IsScriptMalicious(scrip)
	for i ,v in pairs(db) do
		if string.find(scrip.Source, v) then
			return true, i
		end
		wait(1/60)
	end
	return false
end
game.DescendantAdded:connect(function(child)
	if child:IsA("LuaSourceContainer") and not child:IsA("CoreScript") then
		local IsMalicious, VirusName = IsScriptMalicious(child)
		if IsMalicious then
			warn("[VIIRUS DETECTOR]" .. VirusName .. " virus was found at game." .. tostring(child) .. "! (could be a false positive")
		end
	end
end)
