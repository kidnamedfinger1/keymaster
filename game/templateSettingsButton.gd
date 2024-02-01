extends Button

var visibleMenu = false

func _process(delta):
	if visibleMenu == false:
		self.visible = false
		self.z_index = -1
	elif visibleMenu == true:
		self.z_index = 0
		self.visible = true

func _on_settings_menu_pressed():
	if visibleMenu == false:
		visibleMenu = true
	elif visibleMenu == true:
		visibleMenu = false

func _on_quitToMenu_pressed():
	get_tree().change_scene_to_file("res://menu/mainMenu.tscn")





func _on_pressed():
	get_tree().quit()

