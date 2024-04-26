extends Button
var upgradePrice = 100

func _on_pressed():
	if get_node("../../../typeCount").dollars >= upgradePrice:
		get_node("../../../typeCount").dollars -= upgradePrice
		get_node("../../../settingsMenu/soundEffectPlayer")._soundEffectPlay("upgradeSound")
		get_node("../../keymonkeyTextInput").totalKeymonkeys += 1
		get_node("../../keymonkeyTextInput").keymonkeyGrunts += 1
		upgradePrice = upgradePrice + (5 * (get_node("../../keymonkeyTextInput").keymonkeyGrunts * 2))
	else:
		get_node("../../../incorrectIndicator").cash = false
		get_node("../../../settingsMenu/soundEffectPlayer")._soundEffectPlay("mehSound")
