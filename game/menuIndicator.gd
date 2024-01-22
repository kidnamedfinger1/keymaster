extends TextureRect

func _process(delta):
	if get_node("../keymonkeyGrunt").visibleMenu == true || get_node("../quitToMenu").visibleMenu == true || get_node("../quitToDesktop").visibleMenu == true :
		self.visible = true
	else:
		self.visible = false
