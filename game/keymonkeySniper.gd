extends Button
var upgradePrice = 10
var cash = true
var visibleMenu = false

func _process(delta):
	if visibleMenu == false:
		self.visible = false
	elif visibleMenu == true:
		self.visible = true

func _on_pressed():
	if get_node("../../../typeCount").dollars >= upgradePrice:
		get_node("../../../typeCount").dollars -= upgradePrice
		get_node("../../../settingsMenu/soundEffectPlayer")._soundEffectPlay("upgradeSound")
		get_node("../../keymonkeyTextInput").totalKeymonkeys += 1
		get_node("../../keymonkeyTextInput").keymonkeySnipers += 1
		upgradePrice = upgradePrice + (10 * (get_node("../../keymonkeyTextInput").keymonkeySnipers * 2))
	else:
		cash = false
		get_node("../../../settingsMenu/soundEffectPlayer")._soundEffectPlay("mehSound")

func _on_keymonkey_menu_pressed():
	if visibleMenu == false:
		visibleMenu = true
	elif visibleMenu == true:
		visibleMenu = false
