extends TextureRect

func _process(delta):
	if get_node("../keymonkeyGrunt").visibleMenu == true || get_node("../templateSettingsButton").visibleMenu == true:
		self.visible = true
	else:
		self.visible = false
