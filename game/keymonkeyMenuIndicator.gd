extends TextureRect

func _on_keymonkey_menu_pressed():
	if self.visible == true:
		self.visible = false
	else:
		self.visible = true
