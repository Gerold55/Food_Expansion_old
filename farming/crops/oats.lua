
--[[
	Big thanks to PainterlyPack.net for allowing me to use these textures
]]

local S = farming.intllib

-- soy seeds
minetest.register_craftitem("farming:oat_seeds", {
	description = S("Oat Seeds"),
	inventory_image = "farming_oat_seeds.png",
	groups = {seeds = 1, flammable = 2},
	drawtype = "signlike",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_use = minetest.item_eat(8),
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:oats_1")
	end,
})

-- soybean
minetest.register_craftitem("farming:oats", {
	description = S("Oats"),
	inventory_image = "farming_oat.png",
	groups = {seeds = 1, flammable = 2},
	on_use = minetest.item_eat(8),
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:oats_1")
	end,
})

-- soy beans definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_oat_crop0.png"},
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
minetest.register_node("farming:oats_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_oat_crop1.png"}
minetest.register_node("farming:oats_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_oat_crop2.png"}
minetest.register_node("farming:oats_3", table.copy(crop_def))

-- stage 4
crop_def.tiles = {"farming_oat_crop3.png"}
minetest.register_node("farming:oats_4", table.copy(crop_def))

-- stage 5
crop_def.tiles = {"farming_oat_crop4.png"}
minetest.register_node("farming:oats_5", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_oat_crop5.png"}
minetest.register_node("farming:oats_6", table.copy(crop_def))

-- stage 7
crop_def.tiles = {"farming_oat_crop6.png"}
minetest.register_node("farming:oats_7", table.copy(crop_def))

-- stage 8 (final)

crop_def.tiles = {"farming_oat_crop7.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:oats 3, farming:oat_seeds 2'}, rarity = 1},
	}
}
minetest.register_node("farming:oats_8", table.copy(crop_def))



-- add to registered_plants
farming.registered_plants["farming:oats"] = {
	crop = "farming:oats",
	seed = "farming:oats_seeds",
	minlight = 13,
	maxlight = 15,
	steps = 8
}
