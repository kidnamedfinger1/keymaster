extends Button
var upgradePrice = 1000
var cash = true

func _on_pressed():
	if get_node("../../../typeCount").dollars >= upgradePrice:
		get_node("../../../typeCount").dollars -= upgradePrice
		get_node("../../../settingsMenu/soundEffectPlayer")._soundEffectPlay("upgradeSound")
		get_node("../../keymonkeyTextInput").totalKeymonkeys += 1
		get_node("../../keymonkeyTextInput").keymonkeySnipers += 1
		upgradePrice = upgradePrice + (5 * (get_node("../../keymonkeyTextInput").keymonkeySnipers * 8))
	else:
		cash = false
		get_node("../../../settingsMenu/soundEffectPlayer")._soundEffectPlay("mehSound")
