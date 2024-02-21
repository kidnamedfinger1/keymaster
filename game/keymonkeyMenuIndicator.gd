extends TextureRect

func _process(delta):
	if get_node("keymonkeyGrunt").visibleMenu == true:
		self.visible = true
	else:
		self.visible = false

