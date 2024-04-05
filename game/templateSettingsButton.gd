extends Button

func _on_quitToMenu_pressed():
	get_tree().change_scene_to_file("res://menu/mainMenu.tscn")

func _on_pressed():
	get_tree().quit()

#func _ready():
	#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)



func _on_toggled(toggled_on):
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif toggled_on == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
