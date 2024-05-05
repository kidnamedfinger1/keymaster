extends TextureButton


func _on_pressed():
	if get_node("settingsMenuIndicator").visible == false:
		get_node("settingsMenuIndicator").visible = true
		get_node("../keymonkeyMenu/keymonkeyMenuIndicator").visible = false
		get_node("../upgradeMenu/upgradeMenuIndicator").visible = false
	else:
		get_node("settingsMenuIndicator").visible = false
