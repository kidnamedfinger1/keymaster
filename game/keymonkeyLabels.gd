extends Label

func _process(delta):
	get_node("../gruntCountLabel").text = "x" + str(get_node("../keymonkeyTextInput").keymonkeyGrunts)
	if get_node("../keymonkeyMenuIndicator").visible == false:
		get_node("../gruntCountLabel").visible = false
	elif get_node("../keymonkeyMenuIndicator").visible == true && get_node("../keymonkeyTextInput").keymonkeyGrunts > 0:
		get_node("../gruntCountLabel").visible = true
	get_node("../sniperCountLabel").text = "x" + str(get_node("../keymonkeyTextInput").keymonkeySnipers)
	if get_node("../keymonkeyMenuIndicator").visible == false:
		get_node("../sniperCountLabel").visible = false
	elif get_node("../keymonkeyMenuIndicator").visible == true && get_node("../keymonkeyTextInput").keymonkeySnipers > 0:
		get_node("../sniperCountLabel").visible = true
