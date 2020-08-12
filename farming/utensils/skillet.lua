minetest.register_craftitem("farming:skillet", {
	description = ("Skillet"),
	inventory_image = "farming_skillet.png",
})

minetest.register_craft({
	output = 'farming:skillet',
	recipe = {
		{"default:brick", "",  "",},
		{"", "default:brick",  "",},
		{"", "", "default:stick"},
	}
})
