-- Generated from template

if TournamentMode == nil then
	TournamentMode = class({})
end

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
end

require("game_setup") 

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = TournamentMode()
	GameRules.AddonTemplate:InitGameMode()
end

function TournamentMode:InitGameMode()

	print( "Template addon is loaded." )
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
	GameRules:GetGameModeEntity():SetFreeCourierModeEnabled(true)   --Aktivieren von Free Coruieres 
	GameSetup:init()	--Zur einstellung von Custom Pickphase
	
	local GameMode = GameRules:GetGameModeEntity()
	GameMode:SetRecommendedItemsDisabled(true)
	
end

-- Evaluate the state of the game
function TournamentMode:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end