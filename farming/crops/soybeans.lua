
--[[
	Big thanks to PainterlyPack.net for allowing me to use these textures
]]

local S = farming.intllib

-- soy seeds
minetest.register_craftitem("farming:soy_seeds", {
	description = S("Soybean Seeds"),
	inventory_image = "farming_soy_beans.png",
	groups = {seeds = 1, food_veggie = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:soy_1")
	end,
})

-- flour
minetest.register_craft({
	type = "shapeless",
	output = "farming:flour",
	recipe = {
		"farming:mortar_pestle", "farming:soybeans"
	},
	replacements = {{"group:food_mortar_pestle", "farming:mortar_pestle"}},
})

-- soybean
minetest.register_craftitem("farming:soybeans", {
	description = S("SoyBeans"),
	inventory_image = "farming_soybean.png",
	groups = {seeds = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:soy_1")
	end,
})

minetest.register_craftitem("farming:sauce_soy", {
	description = S("Soy Sauce"),
	inventory_image = "farming_soy_sauce.png",
})

minetest.register_craftitem("farming:soy_milk", {
	description = ("Soy Milk"),
	inventory_image = "farming_soy_milk.png",
	on_use = minetest.item_eat(2),
	groups = {food_milk = 1, flammable = 2, vessel = 1},
})

-- soy beans definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_soy_plant_age_0.png"},
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
minetest.register_node("farming:soy_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_soy_plant_age_1.png"}
minetest.register_node("farming:soy_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_soy_plant_age_2.png"}
minetest.register_node("farming:soy_3", table.copy(crop_def))

-- stage 4
crop_def.tiles = {"farming_soy_plant_age_3.png"}
minetest.register_node("farming:soy_4", table.copy(crop_def))

-- stage 5
crop_def.tiles = {"farming_soy_plant_age_4.png"}
minetest.register_node("farming:soy_5", table.copy(crop_def))

-- stage 6 (final)

crop_def.tiles = {"farming_soy_plant_age_5.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:soybeans 3, farming:soy_seeds 2'}, rarity = 1},
	}
}
minetest.register_node("farming:soy_6", table.copy(crop_def))



-- add to registered_plants
farming.registered_plants["farming:soy"] = {
	crop = "farming:soy",
	seed = "farming:soy_seeds",
	minlight = 13,
	maxlight = 15,
	steps = 8
}
