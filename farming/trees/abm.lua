minetest.register_abm({
	label = "Fruit Pod Grow",
	nodenames = {"farming:pod","farming:pod2","farming:pod3"},
	neighbors = {"air"},
	interval = 7,
	chance = 2,

	action = function(pos, node)
		if(node.name == "farming:pod")then
			minetest.swap_node(pos,{name="farming:pod2"})
		elseif(node.name == "farming:pod2")then
			minetest.swap_node(pos,{name="farming:pod3"})
		elseif(node.name == "farming:pod3")then
			local meta = minetest.get_meta(pos)
			local type = meta:get_string("type")

			if type ~= "" then
				minetest.swap_node(pos,{name = "farming:fruit_"..type})
			end
		end

		old_expansion.particles_leafdrop(pos)
	end
})