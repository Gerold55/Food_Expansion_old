
local S = farming.intllib

-- melon
minetest.register_craftitem("farming:melon_seeds", {
	description = S("Watermelon Seeds"),
	inventory_image = "farming_melon_seeds.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:melon_1")
	end,
})

minetest.register_craftitem("farming:melon_slice", {
	description = S("Watermelon Slice"),
	inventory_image = "farming_melon_slice.png",
	groups = {food_melon_slice = 1, flammable = 3},
	on_use = minetest.item_eat(5),
})



minetest.register_craft({
	output = "farming:melon",
	recipe = {
		{"farming:melon_slice", "farming:melon_slice"},
		{"farming:melon_slice", "farming:melon_slice"},
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
minetest.register_node("farming:melon_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_melon_2.png"}
minetest.register_node("farming:melon_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_melon_3.png"}
minetest.register_node("farming:melon_3", table.copy(crop_def))

-- stage 4 (final)

crop_def.tiles = {"farming_melon_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:melon_slice 9'}, rarity = 1},
	}
}
minetest.register_node("farming:melon_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:melon"] = {
	crop = "farming:melon",
	seed = "farming:melon_slice",
	minlight = 13,
	maxlight = 15,
	steps = 8
}

-- melon juice
minetest.register_craftitem("farming:juice_melon", {
	description = S("Watermelon Juice"),
	inventory_image = "farming_juice_melon.png",
	on_use = minetest.item_eat(4, "vessels:drinking_glass"),
	groups = {food_drink = 1, flammable = 2, vessel = 1},
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = "farming:juice_melon",
	type = "shapeless",
	recipe = {
		"farming:juicer", "farming:melon_slice", "",
		"farming:melon_slice", "", "",
		"", "", ""
	},
	replacements = {
		{"group:food_juicer", "farming:juicer"},
	},
})
