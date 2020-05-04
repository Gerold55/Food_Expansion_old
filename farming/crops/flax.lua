
local S = farming.intllib

-- flax seeds
minetest.register_node("farming:seed_flax", {
	description = S("Flax"),
	tiles = {"farming_flax.png"},
	inventory_image = "farming_flax.png",
	wield_image = "farming_flax.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:flax_1")
	end,
})

-- flax definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_flax_1.png"},
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
minetest.register_node("farming:flax_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_flax_2.png"}
minetest.register_node("farming:flax_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_flax_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:seed_flax'}, rarity = 2},
	}
}
minetest.register_node("farming:flax_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_flax_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:seed_flax'}, rarity = 1},
		{items = {'farming:seed_flax'}, rarity = 3},
	}
}
minetest.register_node("farming:flax_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:seed_flax"] = {
	crop = "farming:seed_flax",
	seed = "farming:seed_flax",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:seed_flax",
	burntime = 1,
})
