local S = farming.intllib

-- pumpkin bread
minetest.register_craftitem("farming:pumpkin_bread", {
	description = S("Pumpkin Bread"),
	inventory_image = "farming_pumpkin_bread.png",
	on_use = minetest.item_eat(8),
	groups = {food_bread = 1, flammable = 2},
})

minetest.register_craftitem("farming:pumpkin_dough", {
	description = S("Pumpkin Dough"),
	inventory_image = "farming_dough_pumpkin.png",
})

minetest.register_craft({
	output = "farming:pumpkin_dough",
	type = "shapeless",
	recipe = {"farming:bakeware", "farming:pumpkin_slice", "",
	"group:food_sugar", "farming:dough", "",
	 "", "", ""
	 },
	 replacements = {{ "farming:bakeware", "farming:bakeware"}}
})

minetest.register_craft({
	type = "cooking",
	output = "farming:pumpkin_bread",
	recipe = "farming:pumpkin_dough",
	cooktime = 10
})

-- pumpkin pie
minetest.register_craftitem("farming:pie_pumpkin", {
	description = S("Pumpkin Pie"),
	inventory_image = "farming_pie_pumpkin.png",
	on_use = minetest.item_eat(8),
	groups = {food_pie = 1, flammable = 2},
})

minetest.register_craft({
	output = "farming:pie_pumpkin 9",
	type = "shapeless",
	recipe = {"farming:bakeware", "group:food_pumpkin", "farming:dough",
	"group:food_egg", "group:food_sugar", "",
	 "", "", ""
	 },
	 replacements = {{ "farming:bakeware", "farming:bakeware"}}
})

-- pumpkin soup
minetest.register_craftitem("farming:soup_pumpkin", {
	description = S("Pumpkin Soup"),
	inventory_image = "farming_pumpkin_soup.png",
	on_use = minetest.item_eat(8),
	groups = {food_pie = 1, flammable = 2},
})

minetest.register_craft({
	output = "farming:soup_pumpkin",
	type = "shapeless",
	recipe = {"farming:pot", "group:food_pumpkin", "",
	"group:food_heavycream", "farming:soup_stock", "",
	 "", "", ""
	 },
	 replacements = {{ "farming:pot", "farming:pot"}}
})

minetest.register_craftitem("farming:muffin_pumpkin", {
	description = S("Pumpkin Muffin"),
	inventory_image = "farming_muffin_pumpkin.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = "farming:muffin_pumpkin",
	type = "shapeless",
	recipe = {
		"farming:bakeware", "group:food_pumpkin", "",
		"farming:batter", "", "",
		"", "", ""
	},
	replacements = {
		{"farming:bakeware", "farming:bakeware"},
	},
})
