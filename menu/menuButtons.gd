extends Button

func _on_quit_pressed():
	get_tree().quit()

func _input(event):
	if Input.is_key_pressed(KEY_K):
		get_tree().change_scene_to_file("res://game/game.tscn")
