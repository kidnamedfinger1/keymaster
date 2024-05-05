extends TextureButton



func _on_pressed():
	if get_node("keymonkeyMenuIndicator").visible == false:
		get_node("keymonkeyMenuIndicator").visible = true
		get_node("../settingsMenu/settingsMenuIndicator").visible = false
		get_node("../upgradeMenu/upgradeMenuIndicator").visible = false
	else:
		get_node("keymonkeyMenuIndicator").visible = false
