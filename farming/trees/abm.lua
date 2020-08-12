local fruit_names = {"cherry","pomegranate","peach","apricot","cinnamon","apple","avocado","fig","breadfruit","banana","almond","cashew","date","dragonfruit","durian","guava","hazelnut","grapefruit","gooseberry","jackfruit","coconut","candlenut","lemon","lime","lychee","olive","nutmeg","maple","mango","papaya","passionfruit","pecan","persimmon","pistachio","plum","rambutan","soursop","starfruit","tamarind","vanillabean","walnut","peppeprcorn","pawpaw","paperbark","spiderweb","orange"}
for i, v in ipairs(fruit_names)do 
minetest.register_abm({
    label = "Fruit Pod Grow",
    nodenames = {"farming:pod","farming:pod2","farming:pod3"},
    neighbors = {"air"},
    interval = 7,
    chance = 2,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
			if(node.name == "farming:pod")then
				local type = meta:get_string("type")
				minetest.set_node(pos,{name="farming:pod2"})
				meta:set_string("type",v)
				old_expansion.particles_leafdrop(pos)
			elseif(node.name == "farming:pod2")then
				local type = meta:get_string("type")
				minetest.set_node(pos,{name="farming:pod3"})
				meta:set_string("type",v)
				old_expansion.particles_leafdrop(pos)
			elseif(node.name == "farming:pod3")then
				local type = meta:get_string("type")
				minetest.set_node(pos,{name = "farming:fruit_"..v})
				meta:set_string("type",v)
				old_expansion.particles_leafdrop(pos)
				end
				end
})
end