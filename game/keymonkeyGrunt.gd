extends Button
var upgradePrice = 10
var cash = true
var visibleMenu = false

func _process(delta):
	if visibleMenu == false:
		self.visible = false
		self.z_index = -1
	elif visibleMenu == true:
		self.z_index = 0
		self.visible = true

func _on_pressed():
	if get_node("../typeCount").dollars >= 10:
		get_node("../typeCount").dollars -= 10
		get_node("../soundEffectPlayer")._soundEffectPlay("upgradeSound")
	else:
		cash = false
		get_node("../soundEffectPlayer")._soundEffectPlay("mehSound")



func _on_keymonkey_menu_pressed():
	if visibleMenu == false:
		visibleMenu = true
	elif visibleMenu == true:
		visibleMenu = false


func _on_settings_menu_pressed():
	visibleMenu = false
