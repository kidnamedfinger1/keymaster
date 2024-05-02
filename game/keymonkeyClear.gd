extends Button

func _on_pressed():
	get_node("../keymonkeyTextInput").text = ""
	get_node("../kingTextInput").text = ""
