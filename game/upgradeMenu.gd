extends TextureButton

func _process(delta):
	if get_node("../keymonkeyMenu/kingTextInput").keymonkeyKing == true:
		self.visible = true
	else:
		self.visible = false


func _on_pressed():
	if get_node("upgradeMenuIndicator").visible == false:
		get_node("upgradeMenuIndicator").visible = true
		get_node("../keymonkeyMenu/keymonkeyMenuIndicator").visible = false
		get_node("../settingsMenu/settingsMenuIndicator").visible = false
	else:
		get_node("upgradeMenuIndicator").visible = false
