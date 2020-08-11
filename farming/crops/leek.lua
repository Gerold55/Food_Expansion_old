
--[[
	Big thanks to PainterlyPack.net for allowing me to use these textures
]]

local S = farming.intllib

-- leek seeds
minetest.register_craftitem("farming:leek_seeds", {
	description = S("Leek Seeds"),
	inventory_image = "farming_leek_seed.png",
	groups = {seeds = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:leek_1")
	end,
})

minetest.register_craftitem("farming:leek", {
	description = S("leek"),
	inventory_image = "farming_leek.png",
	on_use = minetest.item_eat(8),
	groups = {food_bread = 1, flammable = 2},
})

-- leek definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_leek_plant_age_0.png"},
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = default.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("farming:leek_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_leek_plant_age_1.png"}
minetest.register_node("farming:leek_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_leek_plant_age_2.png"}
minetest.register_node("farming:leek_3", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_leek_plant_age_3.png"}
minetest.register_node("farming:leek_4", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_leek_plant_age_4.png"}
minetest.register_node("farming:leek_5", table.copy(crop_def))

-- stage 4 (final)

crop_def.tiles = {"farming_leek_plant_age_5.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:leek 1, farming:leek_seeds 2'}, rarity = 1},
	}
}
minetest.register_node("farming:leek_6", table.copy(crop_def))



-- add to registered_plants
farming.registered_plants["farming:leek"] = {
	crop = "farming:leek",
	seed = "farming:leek_seeds",
	minlight = 13,
	maxlight = 15,
	steps = 8
}
