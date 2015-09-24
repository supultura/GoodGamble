local ChatType; --find new way to use non-.toc global variables
local LocalStats = {};
local EnteredPlayers = {};
--OnLoad--
local function OnLoad(self)
	DEFAULT_CHAT_FRAME:AddMessage("|cffff0000<GoodGamble 0.1> /gg for options");
--	local frame = CreateFrame("FRAME"); -- Need a frame to respond to events
--	frame:RegisterEvent("ADDON_LOADED"); -- Fired when saved variables are loaded
--	frame:RegisterEvent("PLAYER_LOGOUT"); -- Fired when about to log out
--	SlashInit();
end

local function PrintMessage(msg)
	DEFAULT_CHAT_FRAME:AddMessage(msg);
end
--TODO--
--#1 PRIORITY--
--XML AND COMMENTS--

--Init--
	--Check if Player has loaded(Blizzard API: PlayerLoadedWorld(?))
	--Chat Channel default
	--Global Variable GoodGamble from GoodGamble.toc
local function init()
	ChatType = "INSTANCE_CHAT";
end
--Chat--
--Cycle through Instance(i) Guild (g)
--Instance works for Party/raid/lfr/instance/general groups
--guild for whatever other reason(Most like for stat posting)
local function ChangeChat()
	if (ChatType == "INSTANCE_CHAT") then
		ChatType = "GUILD";
	else
		ChatType = "INSTANCE_CHAT";
	end
end
--Chat Message Handler--
local function ChatMessage(msg)
	SendChatMessage(msg, ChatType);
end
--ResetGame--
	--break current function
	--Stop listening to 1s, Clear arrays/tables
--EntryListener--
	--check 1s
	--list of entered players
	--remove player from list
--CheckRolls(EnteredPlayers)--
	--ask for rolls
	--listen for rolls, add rolls + players to table, remove players from entered players
	--handle draw
--CompareRolls(TableOfRolls)--
	--sort table
	--TableOfRolls[0][0] - TableOfRolls[SizeOfTable][1] = amount owed, Player1 owes Player2 x gold
	--Check if player is on stats if not add if is -/+
--GameModes--
	--Standard
		--2 or more people roll lowest roll pays difference to highest roll
	--Roll Tournament
		--2^x amount of people in roll tournament (possible seeding based off stats)(seeding if not a power of 2 people selected) 1v1 against each other until their is a champion
		--Tournament winner stats
	--Other Games TBA
		--possible roulette reference?
--Stats--
	--Session (local reset each time)
	--Global (from GoodGamble.toc)
	--table |Player|Gold|
--StatsAdd(TableOfStats, Player, Gold)
	--splits table adds gold re adds player back
--PrintStats(Table)--
	--Print Local Or Global depending on button
	--Sort table
	--print Name has won/lost gold depending on negative
	for i = 0, table.getn(table) do
		local 
--ResetStats--
local function ResetStats()
	GoodGamble["Stats"] = {};
end
--Ban--
local function BanUser(User)
	local Character, Realm = strsplit('-', User);
	Character = Character:lower();
	if(Character ~= nil or Character ~= "") then
		for i = 0, table.getn(GoodGamble.BanList) do
			if GoodGamble.BanList[i] == Character then
				PrintMessage(Character .. "|cffff0000 is already banned from GoodGamble");
				break;
			end
		end
		table.insert(GoodGamble.BanList, Character);
		PrintMessage(Character .. "|cffff0000 has been banned from GoodGamble");
	else
		PrintMessage("|cffff0000 Please enter a name");
	end
end
--Unban--
local function UnbanUser(User)
	local Character, Realm = strsplit('-', User);
	Character = Character:lower();
	if(Character ~= nil or Character ~= "") then
		for i = 0, table.getn(GoodGamble.BanList) do
			if GoodGamble.BanList[i] == Character then
				PrintMessage(Character .. "|cffff0000 is unbanned from GoodGamble");
				table.remove(GoodGamble.BanList, i);
				break;
			else
				PrintMessage(Character .. "|cffff0000 was not banned");
			end
		end
	else
		PrintMessage("|cffff0000 Please enter a name");
	end
end
--BanList--
local function BanList()
	local BanListSize = table.getn(GoodGamble.BanList);
	PrintMessage("cffffff00Currently Banned Players");
	if (BanListSize == 0 or BanListSize == nil) then
		PrintMessage("No players are currently banned");
	else
		for i = 0, i < BanListSize do
			PrintMessage(i + 1 .. ": " .. GoodGamble.BanList[i]);
		end
	end
end

local function Roll(roll)
	RandomRoll(1, roll);
end

local function SlashCmds(cmd)
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
	elseif (option == "roll") then
		Roll(5000);
	else
		PrintMessage("Invalid Command, /gg for list of available options");
	end
end
--local function SlashInit()
	SLASH_GOODGAMBLE1 = "/goodgamble";
	SLASH_GOODGAMBLE2 = "/gg";
	SlashCmdList["GOODGAMBLE"] = SlashCmds;
--end
--the actual gambling--