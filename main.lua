local FruityMod = RegisterMod("Fruit Pack!",1)
local game = Game()
local r = RNG()

local testing = false

FruityMod.COSTUME_CUCUMBER = Isaac.GetCostumeIdByPath("gfx/characters/pepino.anm2")
FruityMod.COSTUME_WATERMELON = Isaac.GetCostumeIdByPath("gfx/characters/watermelonhelmet.anm2")
FruityMod.COSTUME_BANANA = Isaac.GetCostumeIdByPath("gfx/characters/bananacostume.anm2")
FruityMod.COSTUME_SPINACH = Isaac.GetCostumeIdByPath("gfx/characters/popeyehat.anm2")

FruityMod.COSTUME_HEADBAND_RED = Isaac.GetCostumeIdByPath("gfx/characters/headband_red.anm2")
FruityMod.COSTUME_NINJASUIT_RED = Isaac.GetCostumeIdByPath("gfx/characters/ninjasuit_red.anm2")

FruityMod.COSTUME_HEADBAND_YELLOW = Isaac.GetCostumeIdByPath("gfx/characters/headband_yellow.anm2")
FruityMod.COSTUME_NINJASUIT_YELLOW = Isaac.GetCostumeIdByPath("gfx/characters/ninjasuit_yellow.anm2")

FruityMod.COSTUME_HEADBAND_GREY = Isaac.GetCostumeIdByPath("gfx/characters/headband_grey.anm2")
FruityMod.COSTUME_NINJASUIT_GREY = Isaac.GetCostumeIdByPath("gfx/characters/ninjasuit_grey.anm2")

FruityMod.COSTUME_HEADBAND_PURPLE = Isaac.GetCostumeIdByPath("gfx/characters/headband_purple.anm2")
FruityMod.COSTUME_NINJASUIT_PURPLE = Isaac.GetCostumeIdByPath("gfx/characters/ninjasuit_purple.anm2")

local transcounter = 0
local transformation = false
local transformed = false






-- ID TABLE
local FruitId = {
	CUCUMBER = Isaac.GetItemIdByName("Cucumber"),
	BANANA = Isaac.GetItemIdByName("Banana"),
	WATERMELON = Isaac.GetItemIdByName("Watermelon"),
	CHERRY = Isaac.GetItemIdByName("Cherry"),
	SPINACH = Isaac.GetItemIdByName("Spinach"),
	
	DEADONION = Isaac.GetItemIdByName("Dead Onion"),
	LEMONMISHAP = Isaac.GetItemIdByName("Lemon Mishap"),
	THESADONION = Isaac.GetItemIdByName("The Sad Onion"),
	APPLE = Isaac.GetItemIdByName("Apple!"),	
	
	STATBALL = Isaac.GetItemIdByName("statball123")
}

-- "HAS" TABLE
local HasFruit = {
	Cucumber = false,
	Banana = false,
	Watermelon = false,
	Cherry = false,
	Spinach = false,
	
	DeadOnion = false,
	LemonMishap = false,
	TheSadOnion = false,
	Apple = false,

	Statball = false
}

-- UPDATE HasFruit
local function updateHasFruit(player)
	HasFruit.Cucumber = player:HasCollectible(FruitId.CUCUMBER)
	HasFruit.Banana = player:HasCollectible(FruitId.BANANA)
	HasFruit.Watermelon = player:HasCollectible(FruitId.WATERMELON)
	HasFruit.Cherry = player:HasCollectible(FruitId.CHERRY)
	HasFruit.Spinach = player:HasCollectible(FruitId.SPINACH)
end

-- WHEN THE RUN STARTS OR CONTINUES
function FruityMod:onPlayerInit(player)
	updateHasFruit(player)
end
FruityMod:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, FruityMod.onPlayerInit)


-- getFlag (I stole this from Eufuu)
function getFlag(arr, currentFlag)
    number = currentFlag;
   
    for i = 1, #arr do
        number = number | 2^(arr[i] - 1);
    end
   
    return number;
end

-- Transformation function
function rngNinjaCostume()
	local player = game:GetPlayer(0)
	
	local room = game:GetRoom()
	local seed = room:GetDecorationSeed()
	
	
	r:SetSeed(seed, 9999)
	local number = r:RandomInt(6666)
	number = number - math.floor(number/7)*7

	if number == 0 then
		player:AddNullCostume(FruityMod.COSTUME_HEADBAND_GREY)
		player:AddNullCostume(FruityMod.COSTUME_NINJASUIT_RED)
	end
	
	if number == 1 then
		player:AddNullCostume(FruityMod.COSTUME_HEADBAND_RED)
		player:AddNullCostume(FruityMod.COSTUME_NINJASUIT_GREY)
	end

	if number == 2 then
		player:AddNullCostume(FruityMod.COSTUME_HEADBAND_GREY)
		player:AddNullCostume(FruityMod.COSTUME_NINJASUIT_YELLOW)
	end

	if number == 3 then
		player:AddNullCostume(FruityMod.COSTUME_HEADBAND_YELLOW)
		player:AddNullCostume(FruityMod.COSTUME_NINJASUIT_GREY)
	end

	if number == 4 then
		player:AddNullCostume(FruityMod.COSTUME_HEADBAND_GREY)
		player:AddNullCostume(FruityMod.COSTUME_NINJASUIT_PURPLE)
	end

	if number == 5 then
		player:AddNullCostume(FruityMod.COSTUME_HEADBAND_PURPLE)
		player:AddNullCostume(FruityMod.COSTUME_NINJASUIT_GREY)
	end
	if number == 6 then
		player:AddNullCostume(FruityMod.COSTUME_HEADBAND_GREY)
		player:AddNullCostume(FruityMod.COSTUME_NINJASUIT_GREY)
	end
	
	player:AnimateHappy()
	transformed = true
	
	-- While transformations are hardcoded, this is how I applied the bonus stats
	player:AddCollectible(FruitId.STATBALL, 0)
	
end

local pillId = Isaac.GetPillEffectByName("Grandma's Multivitaminics")

function FruityMod:pillUse(pillId)
	
	local player = Isaac.GetPlayer(0)
	player:GetData().MultivitaminicPill = true
	
	local room = game:GetRoom()
	seed = room:GetDecorationSeed() * game:GetFrameCount()
	
	r:SetSeed(seed, 9999)
	local number1 = r:RandomFloat()
	local newnumber1 = number1 - math.floor(number1/1)*1
	
	r:SetSeed(seed, 2378)
	local number2 = r:RandomFloat()
	local newnumber2 = number2 - math.floor(number2/1)*1
	
	r:SetSeed(seed, 5382)
	local number3 = r:RandomFloat()
	local newnumber3 = number3 - math.floor(number3/1)*1
	
	player:SetColor(Color(newnumber1, newnumber2, newnumber3, 1.0, 0.0, 0.0, 0.0), 0, 0, false, false)
	player:AnimateHappy()

end

FruityMod:AddCallback(ModCallbacks.MC_USE_PILL, FruityMod.pillUse, pillId)

function FruityMod:onUpdate()

	local player = game:GetPlayer(0)
	local level = game:GetLevel()
	
	-- SPAWN ITEMS FOR TESTING
	if testing == true then
		if game:GetFrameCount() == 1 then
			Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, FruitId.CUCUMBER, Vector(295,300), Vector(0,0), nil)
			Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, FruitId.BANANA, Vector(345,300), Vector(0,0), nil)
			Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, FruitId.WATERMELON, Vector(395,300), Vector(0,0), nil)
			Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, FruitId.CHERRY, Vector(245,300), Vector(0,0), nil)
			Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, FruitId.SPINACH, Vector(195,300), Vector(0,0), nil)
		end
	end
	
	
	
	
	
	-- Making sure my variables reset after a new run
	if level:GetAbsoluteStage() == 1 and level.EnterDoor == -1 and player.FrameCount == 1 then
		HasFruit.Cucumber = player:HasCollectible(FruitId.CUCUMBER)
		HasFruit.Banana = player:HasCollectible(FruitId.BANANA)
		HasFruit.Watermelon = player:HasCollectible(FruitId.WATERMELON)
		HasFruit.Cherry = player:HasCollectible(FruitId.CHERRY)
		transcounter = 0
		transformation = false
		transformed = false
	end
	
	
	
	
	
	-- AT PICKUPs
	if player:HasCollectible(FruitId.CUCUMBER) and not HasFruit.Cucumber then
		HasFruit.Cucumber = true
		player:AddNullCostume(FruityMod.COSTUME_CUCUMBER)
		transcounter = transcounter + 1
	end
	if player:HasCollectible(FruitId.BANANA) and not HasFruit.Banana then
		HasFruit.Banana = true
		transcounter = transcounter + 1
	end
	if player:HasCollectible(FruitId.WATERMELON) and not HasFruit.Watermelon then
		HasFruit.Watermelon = true
		player:AddNullCostume(FruityMod.COSTUME_WATERMELON)
		transcounter = transcounter + 1
	end
	if player:HasCollectible(FruitId.CHERRY) and not HasFruit.Cherry then
		HasFruit.Cherry = true
		transcounter = transcounter + 1
	end
	if player:HasCollectible(FruitId.SPINACH) and not HasFruit.Spinach then
		HasFruit.Spinach = true
		transcounter = transcounter + 1
	
		-- SPINACH PASSIVE EFFECT
		player:AddCollectible(CollectibleType.COLLECTIBLE_LEO, 0, false)
		--player:TryRemoveCollectibleCostume(CollectibleType.COLLECTIBLE_LEO, true)
		--player:ClearCostumes()
		player:AddNullCostume(FruityMod.COSTUME_SPINACH)
	end
	
	
	if player:HasCollectible(FruitId.DEADONION) and not HasFruit.DeadOnion then
		HasFruit.DeadOnion = true
		transcounter = transcounter + 1
	end
	if player:HasCollectible(FruitId.LEMONMISHAP) and not HasFruit.LemonMishap then
		HasFruit.LemonMishap = true
		transcounter = transcounter + 1
	end
	if player:HasCollectible(FruitId.THESADONION) and not HasFruit.TheSadOnion then
		HasFruit.TheSadOnion = true
		transcounter = transcounter + 1
	end
	if player:HasCollectible(FruitId.APPLE) and not HasFruit.Apple then
		HasFruit.Apple = true
		transcounter = transcounter + 1
	end
	
	-- "STATBALL" shenanigans
	if player:HasCollectible(FruitId.STATBALL) and not HasFruit.Statball then
		HasFruit.Statball = true
	end
	
	
	
	
	-- Transformation logic
	if transformed == false then
		if transcounter > 2 then
			transformation = true
			player:AnimateHappy()
			player:EvaluateItems() 
			rngNinjaCostume()
		end
	end
	
	
	
	
	-- BANANA HOLDING EFFECT
	if player:HasCollectible(FruitId.BANANA) then
		for i, entity in pairs(Isaac.GetRoomEntities()) do
			if entity:IsActiveEnemy() then
				if entity.Type == 13 or entity.Type == 18 or entity.Type == 96 or entity.Type == 222 or entity.Type == 256 or entity.Type == 281 then -- enemy flies
					local where = entity.Position -- get the position before the enemy fly disapears
					entity:Remove() -- remove the enemy fly
					Isaac.Spawn(EntityType.ENTITY_FAMILIAR, FamiliarVariant.BLUE_FLY, 43, where, Vector(0,0), nil) -- spawn a familiar blue fly
				end
			end
		end
	end

end
	
	
	
	
	
-- BANANA ACTIVE EFFECT
function FruityMod:bananaUse()
	
	local player = game:GetPlayer(0)
	player:AddNullCostume(FruityMod.COSTUME_BANANA)
	player:AnimateHappy()
	player:AddEternalHearts(1)
	player:RemoveCollectible(FruitId.BANANA)

end
	
	
	
	
	
-- CHERRY ACTIVE EFFECT
function FruityMod:cherryUse()
	
	local player = game:GetPlayer(0)
	player:AnimateCollectible(FruitId.CHERRY, "UseItem", "Idle")
	
	local where = Vector(player.Position.X+50, player.Position.Y-25)
	Isaac.Spawn(EntityType.ENTITY_SLOT, 2, 2, where, Vector(0,0), nil)
	Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.POOF01, 0, where, Vector(0,0), nil)
	
	
	local where = Vector(player.Position.X-50, player.Position.Y-25)
	Isaac.Spawn(EntityType.ENTITY_SLOT, 1, 1, where, Vector(0,0), nil)
	Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.POOF01, 0, where, Vector(0,0), nil)

	
	local where = Vector(player.Position.X, player.Position.Y+25)
	Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, CoinSubType.COIN_LUCKYPENNY, where, Vector(1,0.25), nil)	
	
	local sound_entity = Isaac.Spawn(EntityType.ENTITY_FLY, 0, 0, where, Vector(0,0), nil):ToNPC()
	sound_entity:PlaySound(SoundEffect.SOUND_SLOTSPAWN, 100, 0, false, 1)
	sound_entity:Remove()
	
	player:RemoveCollectible(FruitId.CHERRY)

end
	
	
	
	
		
	
	
	
	
-- CACHE STATS UPDATE
function FruityMod:onCache(player, cacheFlag)

	
	
	if cacheFlag == CacheFlag.CACHE_DAMAGE then
		if player:HasCollectible(FruitId.STATBALL) then
			player.Damage = player.Damage * 1.25
		end
		if player:HasCollectible(FruitId.SPINACH) then
			player.Damage = player.Damage + 1
		end
	end
	
--	if cacheFlag == CacheFlag.CACHE_FIREDELAY then
--		if player:HasCollectible() then
--			
--		end
--	end
	
	if cacheFlag == CacheFlag.CACHE_SHOTSPEED then		
		if player:HasCollectible(FruitId.WATERMELON) then
			player.ShotSpeed = player.ShotSpeed + 0.9
		end
		
		if player:HasCollectible(FruitId.STATBALL) then
			player.ShotSpeed = player.ShotSpeed + 0.3
		end
	end
	
	if cacheFlag == CacheFlag.CACHE_RANGE then
		if player:HasCollectible(FruitId.STATBALL) then
			player.Range = player.Range + 0.25
		end
	end
	
	if cacheFlag == CacheFlag.CACHE_SPEED then
		if player:HasCollectible(FruitId.CUCUMBER) then
			player.MoveSpeed = player.MoveSpeed + 0.5
		end

		if player:HasCollectible(FruitId.STATBALL) then
			player.Speed = player.Speed + 0.4
		end		
	end
	
	if cacheFlag == CacheFlag.CACHE_TEARFLAG then
		if player:HasCollectible(FruitId.WATERMELON) then
			player.TearFlags = getFlag({2}, player.TearFlags)
		end
	end
	
	if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
		if player:HasCollectible(FruitId.WATERMELON) then
			player.TearColor = Color(0,0,0,1,0,0,0)
		end
	end
	
--	if cacheFlag == CacheFlag.CACHE_FLYING then
--		if player:HasCollectible() then
--			
--		end
--	end
	
--	if cacheFlag == CacheFlag.CACHE_LUCK then
--		if player:HasCollectible() then
--		
--		end
--	end
	
end






-- CALLBACKS
FruityMod:AddCallback(ModCallbacks.MC_POST_UPDATE,FruityMod.onUpdate)
FruityMod:AddCallback(ModCallbacks.MC_USE_ITEM, FruityMod.bananaUse, FruitId.BANANA)
FruityMod:AddCallback(ModCallbacks.MC_USE_ITEM, FruityMod.cherryUse, FruitId.CHERRY)
FruityMod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, FruityMod.onCache)