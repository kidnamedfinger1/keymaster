extends Button

func _on_quitToMenu_pressed():
	get_tree().change_scene_to_file("res://menu/mainMenu.tscn")

func _on_pressed():
	get_tree().quit()




