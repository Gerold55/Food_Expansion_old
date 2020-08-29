
local S = farming.intllib

-- melon
minetest.register_craftitem("farming:sweet_melon_seeds", {
	description = S("Cantelope Seeds"),
	inventory_image = "farming_cantaloupe_seeds.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:sweet_melon_1")
	end,
})

minetest.register_craftitem("farming:sweet_melon_slice", {
	description = S("Cantelope Slice"),
	inventory_image = "farming_sweet_melon_slice.png",
	groups = {fruity = 1},
	on_use = minetest.item_eat(5),
})



minetest.register_craft({
	output = "farming:sweet_melon",
	recipe = {
		{"farming:sweet_melon_slice", "farming:sweet_melon_slice"},
		{"farming:sweet_melon_slice", "farming:sweet_melon_slice"},
	}
})

-- melon definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_melon_1.png"},
	paramtype = "light",
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
minetest.register_node("farming:sweet_melon_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_melon_2.png"}
minetest.register_node("farming:sweet_melon_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_sweet_melon_3.png"}
minetest.register_node("farming:sweet_melon_3", table.copy(crop_def))

-- stage 4 (final)

crop_def.tiles = {"farming_sweet_melon_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:sweet_melon_slice 9'}, rarity = 1},
	}
}
minetest.register_node("farming:sweet_melon_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:sweet_melon"] = {
	crop = "farming:sweet_melon",
	seed = "farming:sweet_melon_slice",
	minlight = 13,
	maxlight = 15,
	steps = 8
}