
local S = farming.intllib

-- wheat seeds
minetest.register_node("farming:seed_rice", {
	description = S("Rice Seed"),
	tiles = {"farming_rice_seeds.png"},
	inventory_image = "farming_rice_seeds.png",
	wield_image = "farming_rice_seeds.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 4},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:rice_1")
	end,
})

-- harvested wheat
minetest.register_craftitem("farming:rice", {
	description = S("Rice"),
	inventory_image = "farming_rice.png",
	groups = {food_wheat = 1, flammable = 4},
})

-- straw
--minetest.register_node("farming:straw", {
--	description = S("Straw"),
--	tiles = {"farming_straw.png"},
--	is_ground_content = false,
--	groups = {snappy = 3, flammable = 4, fall_damage_add_percent = -30},
--	sounds = default.node_sound_leaves_defaults(),
--})

--minetest.register_node("farming:straw", {
--	description = "Straw",
--	tiles = {"farming_straw.png"},
--	is_ground_content = false,
--	groups = {snappy=3, flammable=4, fall_damage_add_percent=-30},
--	sounds = default.node_sound_leaves_defaults(),
--})

---minetest.register_craft({
---	output = "farming:straw 3",
--	recipe = {
--		{"farming:wheat", "farming:wheat", "farming:wheat"},
--		{"farming:wheat", "farming:wheat", "farming:wheat"},
--		{"farming:wheat", "farming:wheat", "farming:wheat"},
--	}
--})

-- wheat definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_rice_plant_age_0.png"},
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 3,
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 4, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = default.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("farming:rice_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_rice_plant_age_1.png"}
minetest.register_node("farming:rice_2", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_rice_plant_age_2.png"}
minetest.register_node("farming:rice_3", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_rice_plant_age_3.png"}
minetest.register_node("farming:rice_4", table.copy(crop_def))

minetest.register_node("farming:rice_5", table.copy(crop_def))

-- stage 4
crop_def.tiles = {"farming_rice_plant_age_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:rice'}, rarity = 1},
		{items = {'farming:rice'}, rarity = 3},
		{items = {'farming:seed_rice'}, rarity = 1},
		{items = {'farming:seed_rice'}, rarity = 3},
	}
}
minetest.register_node("farming:rice_6", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:rice"] = {
	crop = "farming:rice",
	seed = "farming:seed_rice",
	minlight = 13,
	maxlight = 15,
	steps = 8
}
