extends TextEdit


# Called when the node enters the scene tree for the first time.
func _ready():
	grab_focus()


func _on_upgrade_1_pressed():
	grab_focus()



func _on_settings_menu_pressed():
	grab_focus()


func _on_keymonkey_menu_pressed():
	grab_focus()


func _on_keymonkey_grunt_pressed():
	grab_focus()



func _on_fullscreenToggle_toggled(toggled_on):
	if toggled_on == true :
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else :
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
