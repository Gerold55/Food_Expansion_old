minetest.register_craftitem("farming:pie_apple", {
	description = ("Apple Pie"),
	inventory_image = "farming_pie_apple.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	output = "farming:pie_apple 9",
	recipe = {
		{"farming:bakeware", "default:apple", ""},
		{"group:food_sugar", "farming:dough", ""},
		{"", "", ""},
	},
	replacements = {{ "farming:bakeware", "farming:bakeware"}}
})

minetest.register_craftitem("farming:apple_sauce", {
	description = ("Apple Sauce"),
	inventory_image = "farming_applesauce.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	output = "farming:apple_sauce",
	recipe = {
		{"farming:pot", "default:apple", ""},
		{"", "", ""},
		{"", "", ""},
	},
	replacements = {{ "farming:pot", "farming:pot"}}
})

minetest.register_craftitem("farming:juice_apple", {
	description = ("Apple Juice"),
	inventory_image = "farming_juice_apple.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	output = "farming:juice_apple",
	recipe = {
		{"farming:juicer", "default:apple", ""},
		{"default:apple", "", ""},
		{"", "", ""},
	},
	replacements = {{ "farming:juicer", "farming:juicer"}}
})

minetest.register_craftitem("farming:jelly_apple", {
	description = ("Apple Jelly"),
	inventory_image = "farming_jelly_apple.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	output = "farming:jelly_apple",
	recipe = {
		{"farming:saucepan", "default:apple", ""},
		{"group:food_sugar", "", ""},
		{"", "", ""},
	},
	replacements = {{ "farming:saucepan", "farming:saucepan"}}
})

minetest.register_craftitem("farming:sandwich_applejelly_peanutbutter", {
	description = ("Peanut Butter & Apple Jelly Sandwich"),
	inventory_image = "farming_sandwich_pb_aj.png",
	on_use = minetest.item_eat(5),
	groups = {food_type_meal = 1},
})

minetest.register_craft({
	output = "farming:sandwich_applejelly_peanutbutter",
	recipe = {
		{"farming:cutting_board", "group:nut_butter", ""},
		{"farming:jelly_apple", "farming:bread_slice", ""},
		{"", "", ""},
	},
	replacements = {{ "farming:cutting_board", "farming:cutting_board"}}
})

minetest.register_craftitem("farming:sandwich_applejelly", {
	description = ("Apple Jelly Sandwich"),
	inventory_image = "farming_sandwich_aj.png",
	on_use = minetest.item_eat(5),
	groups = {food_type_meal = 1},
})

minetest.register_craft({
	output = "farming:sandwich_applejelly",
	recipe = {
		{"farming:cutting_board", "farming:jelly_apple", ""},
		{"farming:bread_slice", "", ""},
		{"", "", ""},
	},
	replacements = {{ "farming:cutting_board", "farming:cutting_board"}}
})

minetest.register_craftitem("farming:sandwich_applesauce", {
	description = ("Apple Jelly Sandwich"),
	inventory_image = "farming_sandwich_as.png",
	on_use = minetest.item_eat(5),
	groups = {food_type_meal = 1},
})

minetest.register_craft({
	output = "farming:sandwich_applesauce",
	recipe = {
		{"farming:cutting_board", "farming:apple_sauce", ""},
		{"farming:bread_slice", "", ""},
		{"", "", ""},
	},
	replacements = {{ "farming:cutting_board", "farming:cutting_board"}}
})

minetest.register_craftitem("farming:apple_fritter", {
	description = ("Apple Fritter"),
	inventory_image = "farming_apple_fritter.png",
	on_use = minetest.item_eat(5),
	groups = {food_type_dessert = 1},
})

minetest.register_craft({
	output = "farming:apple_fritter",
	recipe = {
		{"farming:pot", "default:apple", "farming:dough"},
		{"group:food_sugar", "farming:cooking_oil", ""},
		{"", "", ""},
	},
	replacements = {{ "farming:pot", "farming:pot"}}
})