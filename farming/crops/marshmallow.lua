
--[[
	Original textures from PixelBox texture pack
	https://forum.minetest.net/viewtopic.php?id=4990
]]

local S = farming.intllib

-- marshmallow root
minetest.register_craftitem("farming:marshmallow_root", {
	description = S("Marshmallow Root"),
	inventory_image = "farming_marshmallow_root.png",
	groups = {food_peanut = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:marshmallow_1")
	end,
})

-- marshmallow
minetest.register_craftitem("farming:marshmallow", {
	description = S("Marshmallow"),
	inventory_image = "farming_marshmallow.png",
	on_use = minetest.item_eat(2),
	groups = {food_peanut_butter = 1, flammable = 2, vessel = 1},
})

-- marshmallow definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_marshmallow_plant_1.png"},
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
minetest.register_node("farming:marshmallow_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_marshmallow_plant_2.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:marshmallow_root 2'}, rarity = 1},
		{items = {'farming:marshmallow_root 3'}, rarity = 2},
	}
}
minetest.register_node("farming:marshmallow_2", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:marshmallow"] = {
	crop = "farming:marshmallow",
	seed = "farming:marshmallow_root",
	minlight = 13,
	maxlight = 15,
	steps = 8
}
