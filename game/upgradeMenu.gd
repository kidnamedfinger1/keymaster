extends TextureButton

func _process(delta):
	if get_node("../keymonkeyMenu/keymonkeyTextInput").keymonkeyKing == true:
		self.visible = true
	else:
		self.visible = false
