extends Node2D

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://game/game.tscn")
	


func _on_quit_pressed():
	get_tree().quit()


