local S = farming.intllib

minetest.register_craftitem("farming:potato_buttered", {
	description = S("Buttered Potato"),
	inventory_image = "farming_potato_buttered.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = "farming:potato_buttered",
	type = "shapeless",
	recipe = {
		"farming:baked_potato", "farming:butter", "",
		"", "", "",
		"", "", ""
	},
})