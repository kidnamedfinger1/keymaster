extends TextureButton

func _process(delta):
	if get_node("../keymonkeyMenu/keymonkeyTextInput").keymonkeyKing == true:
		self.visible = true
	else:
		self.visible = false


func _on_pressed():
	if get_node("upgradeMenuIndicator").visible == false:
		get_node("upgradeMenuIndicator").visible = true
	else:
		get_node("upgradeMenuIndicator").visible = false
