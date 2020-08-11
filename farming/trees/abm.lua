local type = fruit_names
node_type = fruit_names
local fruit_names = {"cherries","olives","pomegranate","cinnamon","peach","apricot","apple","avocado","fig","breadfruit","banana","almond","cashew","date","dragonfruit","durian","grapes","guava","hazelnut","grapefruit","gooseberry","jackfruit","coconut","candlenut","lemon","lime","lychee","nutmeg","maple","mango","papaya","passionfruit","pecan","persimmon","pistachio","plum","rambutan","soursop","starfruit","tamarind","vanillabean","walnut","peppercorn","pawpaw","spiderweb","orange"}
minetest.register_abm({
    label = "Fruit Pod Grow",
    nodenames = {"farming:pod","farming:pod2","farming:pod3"},
    neighbors = {"air"},
    interval = 7,
    chance = 0.5,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
			if(node.name == "farming:pod")then
				local type = meta:get_string("type")
				minetest.set_node(pos,{name="farming:pod2"})
				meta:set_string("type",type)
				old_expansion.particles_leafdrop(pos)
			elseif(node.name == "farming:pod2")then
				local type = meta:get_string("type")
				minetest.set_node(pos,{name="farming:pod3"})
				meta:set_string("type",type)
				old_expansion.particles_leafdrop(pos)
			elseif(node.name == "farming:pod3")then
				local type = meta:get_string("type")
				minetest.set_node(pos,{name = "farming:fruit_"..type})
				meta:set_string("type",type)
				old_expansion.particles_leafdrop(pos)
				end
				if(meta:get_string("type") ~= "") then
				end
				end
})