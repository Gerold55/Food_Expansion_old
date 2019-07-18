
local S = farming.intllib

-- greengrapes seeds
minetest.register_node("farming:seed_greengrapes", {
	description = S("greengrapes Seed"),
	tiles = {"farming_greengrape_seed.png"},
	inventory_image = "farming_greengrape_seed.png",
	wield_image = "farming_greengrape_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:greengrapes_1")
	end,
})

-- harvested greengrapes
minetest.register_craftitem("farming:greengrapes", {
	description = S("greengrapes"),
	inventory_image = "farming_greengrape.png",
	groups = {food_greengrapes = 1, flammable = 2},
})

-- greengrapes definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_greengrape_1.png"},
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 3,
	sunlight_propagates = true,
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
minetest.register_node("farming:greengrapes_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_greengrape_2.png"}
minetest.register_node("farming:greengrapes_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_greengrape_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:greengrapes'}, rarity = 2},
		{items = {'farming:seed_greengrapes'}, rarity = 1},
	}
}
minetest.register_node("farming:greengrapes_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_greengrape_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:greengrapes'}, rarity = 1},
		{items = {'farming:greengrapes'}, rarity = 3},
		{items = {'farming:seed_greengrapes'}, rarity = 1},
		{items = {'farming:seed_greengrapes'}, rarity = 3},
	}
}
minetest.register_node("farming:greengrapes_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:greengrapes"] = {
	crop = "farming:greengrapes",
	seed = "farming:seed_greengrapes",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

minetest.register_craftitem("farming:juice_grapes", {
	description = S("Grape Juice"),
	inventory_image = "farming_grape_juice.png",
	groups = {food_grape = 1, flammable = 2},
	on_use = minetest.item_eat(2),
})

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:greengrapes",
	burntime = 1,
})
