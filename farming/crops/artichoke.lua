
local S = farming.intllib

-- artichoke seeds
minetest.register_node("farming:seed_artichoke", {
	description = S("Artichoke Seed"),
	tiles = {"farming_artichoke_seed.png"},
	inventory_image = "farming_artichoke_seed.png",
	wield_image = "farming_artichoke_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:artichoke_1")
	end,
})

-- harvested artichoke
minetest.register_craftitem("farming:artichoke", {
	description = S("Artichoke"),
	inventory_image = "farming_artichoke.png",
	groups = {food_artichoke = 1, flammable = 2},
})

-- artichoke definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_artichoke_1.png"},
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
minetest.register_node("farming:artichoke_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_artichoke_2.png"}
minetest.register_node("farming:artichoke_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_artichoke_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:artichoke'}, rarity = 2},
		{items = {'farming:seed_artichoke'}, rarity = 1},
	}
}
minetest.register_node("farming:artichoke_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_artichoke_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:artichoke'}, rarity = 1},
		{items = {'farming:artichoke'}, rarity = 3},
		{items = {'farming:seed_artichoke'}, rarity = 1},
		{items = {'farming:seed_artichoke'}, rarity = 3},
	}
}
minetest.register_node("farming:artichoke_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:artichoke"] = {
	crop = "farming:artichoke",
	seed = "farming:seed_artichoke",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:artichoke",
	burntime = 1,
})
