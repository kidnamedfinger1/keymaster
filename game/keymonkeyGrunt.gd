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
	if get_node("../typeCount").dollars >= 100:
		get_node("../typeCount").dollars -= 100
		get_node("../soundEffectPlayer")._soundEffectPlay("upgradeSound")
		get_node("../keymonkeyTextInput").totalKeymonkeys += 1
		get_node("../keymonkeyTextInput").keymonkeyGrunts += 1
	else:
		cash = false
		get_node("../soundEffectPlayer")._soundEffectPlay("mehSound")



func _on_keymonkey_menu_pressed():
	if visibleMenu == false:
		visibleMenu = true
	elif visibleMenu == true:
		visibleMenu = false

