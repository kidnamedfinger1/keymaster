extends Label

func _process(delta):
	get_node("../../keymonkeyGrunt/gruntCountLabel").text = "x" + str(get_node("../../../keymonkeyTextInput").keymonkeyGrunts)
	get_node("../../keymonkeySniper/sniperCountLabel").text = "x" + str(get_node("../../../keymonkeyTextInput").keymonkeySnipers)
	get_node("../../keymonkeyBrute/bruteCountLabel").text = "x" + str(get_node("../../../keymonkeyTextInput").keymonkeyBrutes)
	get_node("../../keymonkeyMage/mageCountLabel").text = "x" + str(get_node("../../../keymonkeyTextInput").keymonkeyMages)
	get_node("../../keymonkeyGrunt/gruntCostLabel").text = "$" + str(get_node("../../keymonkeyGrunt").upgradePrice)
	get_node("../../keymonkeySniper/sniperCostLabel").text = "$" + str(get_node("../../keymonkeySniper").upgradePrice)
	get_node("../../keymonkeyBrute/bruteCostLabel").text = "$" + str(get_node("../../keymonkeyBrute").upgradePrice)
	get_node("../../keymonkeyMage/mageCostLabel").text = "$" + str(get_node("../../keymonkeyMage").upgradePrice)
