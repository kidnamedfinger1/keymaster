extends Label

func _process(delta):
	get_node("../gruntLabel").text = "x" + str(get_node("../keymonkeyTextInput").keymonkeyGrunts)
	if get_node("../keymonkeyMenuIndicator").visible == false:
		self.visible = false
	elif get_node("../keymonkeyMenuIndicator").visible == true && get_node("../keymonkeyTextInput").keymonkeyGrunts > 0:
		self.visible = true

