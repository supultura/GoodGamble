
--OnLoad--
function OnLoad(self)
	DEFAULT_CHAT_FRAME:AddMessage("|cffff0000<GoodGamble 0.1> /gg for options");
end

function PrintMessage(msg)
	DEFAULT_CHAT_FRAME:AddMessage(text);
end

function SlashCmds(cmd)
	local option = cmd:lower();
	if (option == "" or option == nil) then
		PrintMessage("|cffff0000<Commands for GoodGamble>");
		PrintMessage("|cffffff00 /gg show - shows the GoodGamble window");
		PrintMessage("|cffffff00 /gg hide - hides the GoodGamble window");
		PrintMessage("|cffffff00 /gg reset - resets the current game");
		PrintMessage("|cffffff00 /gg resetstats - resets the GoodGamble Stats");
		PrintMessage("|cffffff00 /gg ban [user] - bans user from GoodGamble");
		PrintMessage("|cffffff00 /gg unban [user] - unbans user from GoodGamble");
		PrintMessage("|cffffff00 /gg banlist - shows banlist");
	elseif (option == "show") then
		GoodGamble_Frame:Show();
	elseif (option == "hide") then
		GoodGamble_Frame:Hide();
	elseif (option == "reset") then
		ResetGame();
	elseif (option == "resetstats") then
		ResetStats();
	elseif (string.sub(option, 1, 3) == "ban") then
		BanUser(strsub(option, 5));
	elseif (string.sub(option, 1, 5) == "unban") then
		UnbanUser(strsub(option, 7));
	elseif (option == "banlist") then
		BanList();
	else
		PrintMessage("Invalid Command, /gg for list of available options");
	end
end
SLASH_GOODGAMBLE1 = "/goodgamble";
SLASH_GOODGAMBLE2 = "/gg";
SlashCmdList["GOODGAMBLE"] = SlashCmds;
--TODO--
--ResetGame--
--ResetStats--
--Ban--
--Unban--
--BanList--