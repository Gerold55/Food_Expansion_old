minetest.register_craftitem("farming:taco", {
	description = ("Taco"),
	inventory_image = "farming_taco.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	output = "farming:taco",
	recipe = {
		{"farming:cutting_board", "group:food_meat", "farming:lettuce"},
		{"group:food_cheese", "farming:tortilla", ""},
		{"", "", ""},
	},
	replacements = {{ "farming:bakeware", "farming:bakeware"}}
})

minetest.register_craftitem("farming:tortilla", {
	description = ("Tortilla"),
	inventory_image = "farming_tortilla.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:tortilla",
	recipe = {
		"farming:skillet", "farming:cornmeal","group:water_bucket"
	},
	replacements = {{ "farming:skillet", "farming:skillet"}}
})
