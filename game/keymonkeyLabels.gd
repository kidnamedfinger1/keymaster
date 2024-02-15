extends Label

func _process(delta):
	get_node("../../keymonkeyGrunt/gruntCountLabel").text = "x" + str(get_node("../../../keymonkeyTextInput").keymonkeyGrunts)
	if get_node("../../../keymonkeyMenuIndicator").visible == false:
		get_node("../../keymonkeyGrunt/gruntCountLabel").visible = false
	elif get_node("../../../keymonkeyMenuIndicator").visible == true && get_node("../../../keymonkeyTextInput").keymonkeyGrunts > 0:
		get_node("../../keymonkeyGrunt/gruntCountLabel").visible = true
	get_node("../../keymonkeySniper/sniperCountLabel").text = "x" + str(get_node("../../../keymonkeyTextInput").keymonkeySnipers)
	if get_node("../../../keymonkeyMenuIndicator").visible == false:
		get_node("../../keymonkeySniper/sniperCountLabel").visible = false
	elif get_node("../../../keymonkeyMenuIndicator").visible == true && get_node("../../../keymonkeyTextInput").keymonkeySnipers > 0:
		get_node("../../keymonkeySniper/sniperCountLabel").visible = true
