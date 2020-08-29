local S = farming.intllib

-- pumpkin bread
minetest.register_craftitem("farming:souffle_sweet_potato", {
	description = S("Sweet Potato Souffle"),
	inventory_image = "farming_sweet_potato_souffle.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:souffle_sweet_potato",
	recipe = {
		"farming:bakeware", "farming:sweet_potato", "farming:pecan",
		"farming:dough", "farming:butter", "",
		"", "", ""
	}
})