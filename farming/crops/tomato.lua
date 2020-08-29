
local S = farming.intllib

-- tomato seeds
minetest.register_node("farming:seed_tomato", {
	description = S("Tomato Seed"),
	tiles = {"farming_tomato_seed.png"},
	inventory_image = "farming_tomato_seed.png",
	wield_image = "farming_tomato_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:tomato_1")
	end,
})

-- harvested tomato
minetest.register_craftitem("farming:tomato", {
	description = S("Tomato"),
	inventory_image = "farming_tomato.png",
	groups = {food_tomato = 1, flammable = 2},
})

-- harvested green tomato
minetest.register_craftitem("farming:tomato_green", {
	description = S("Green Tomato"),
	inventory_image = "farming_green_tomato.png",
	groups = {food_tomato = 1, flammable = 2},
})

minetest.register_craftitem("farming:soup_tomato", {
	description = S("Tomato Soup"),
	inventory_image = "farming_soup_tomato.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:soup_tomato",
	recipe = {
		"farming:pot", "farming:tomato", "",
		"farming:soup_stock", "", "",
		"", "", ""
	},
	replacements = {{"farming:pot", "farming:pot"}},
})


-- tomato definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_tomato_1.png"},
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
minetest.register_node("farming:tomato_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_tomato_2.png"}
crop_def.drop = {
	items = {
		{items = {'farming:tomato_green'}, rarity = 1},
		{items = {'farming:seed_tomato'}, rarity = 1},
	}
}
minetest.register_node("farming:tomato_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_tomato_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:tomato_green'}, rarity = 3},
		{items = {'farming:seed_tomato'}, rarity = 1},
	}
}
minetest.register_node("farming:tomato_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_tomato_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:tomato'}, rarity = 1},
		{items = {'farming:tomato'}, rarity = 3},
		{items = {'farming:seed_tomato'}, rarity = 1},
		{items = {'farming:seed_tomato'}, rarity = 3},
	}
}
minetest.register_node("farming:tomato_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:tomato"] = {
	crop = "farming:tomato",
	seed = "farming:seed_tomato",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:tomato",
	burntime = 1,
})
