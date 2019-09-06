minetest.register_craftitem("farming:mixingbowl", {
	description = ("Mixing Bowl"),
	inventory_image = "farming_mixing_bowl.png",
})

minetest.register_craft({
	output = 'farming:mixingbowl',
	recipe = {
		{"group:wood", "default:stick",  "group:wood",
		"", "group:wood", ""},
	}
})