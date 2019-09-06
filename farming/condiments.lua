minetest.register_craftitem("farming:ketchup", {
	description = ("Ketchup"),
	inventory_image = "farming_ketchup.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:ketchup",
	recipe = {
		"farming:juicer", "farming:tomato", "",
		"", "", "",
		"", "", ""
	},
})