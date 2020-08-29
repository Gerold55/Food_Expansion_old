
--[[
	Original textures from PixelBox texture pack
	https://forum.minetest.net/viewtopic.php?id=4990
]]

local S = farming.intllib

-- carrot
minetest.register_craftitem("farming:carrot", {
	description = S("Carrot"),
	inventory_image = "farming_carrot.png",
	groups = {food_veggie = 1, food_type_snack = 1},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:carrot_1")
	end,
	on_use = minetest.item_eat(4),
})

-- carrot juice
minetest.register_craftitem("farming:juice_carrot", {
	description = S("Carrot Juice"),
	inventory_image = "farming_juice_carrot.png",
	on_use = minetest.item_eat(4, "vessels:drinking_glass"),
	groups = {food_drink = 1, flammable = 2, vessel = 1},
})

minetest.register_craft({
	output = "farming:juice_carrot",
	type = "shapeless",
	recipe = {
		"farming:juicer", "farming:carrot", "",
		"farming:carrot", "", "",
		"", "", ""
	},
	replacements = {
		{"group:food_juicer", "farming:juicer"},
	},
})

-- golden carrot
minetest.register_craftitem("farming:carrot_gold", {
	description = S("Golden Carrot"),
	inventory_image = "farming_carrot_golden.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craft({
	output = "farming:carrot_gold",
	recipe = {
		{"", "default:gold_lump", ""},
		{"default:gold_lump", "farming:carrot", "default:gold_lump"},
		{"", "default:gold_lump", ""},
	}
})

-- carrot definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_carrot_1.png"},
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
minetest.register_node("farming:carrot_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_carrot_2.png"}
minetest.register_node("farming:carrot_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_carrot_3.png"}
minetest.register_node("farming:carrot_3", table.copy(crop_def))

-- stage 4 (final)
crop_def.tiles = {"farming_carrot_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:carrot 2'}, rarity = 1},
		{items = {'farming:carrot 3'}, rarity = 2},
	}
}
minetest.register_node("farming:carrot_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:carrot"] = {
	crop = "farming:carrot",
	seed = "farming:carrot",
	minlight = 13,
	maxlight = 15,
	steps = 8
}
