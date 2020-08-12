minetest.register_craftitem("farming:cutting_board", {
	description = ("Cutting Board"),
	inventory_image = "farming_cutting_board.png",
})

minetest.register_craft({
	output = 'farming:cutting_board',
	recipe = {
		{"default:brick", "",  "",},
		{"", "default:stick",  "",},
		{"", "", "group:wood"},
	}
})
