extends Label

func _process(delta):
	if get_node("../keymonkeyTextInput").keymonkeyGrunts > 0:
		get_node("../gruntLabel").visible = true
		get_node("../gruntLabel").text = "x" + str(get_node("../keymonkeyTextInput").keymonkeyGrunts)

