extends Button
var upgradePrice = 100000


func _on_pressed():
	if get_node("../../../typeCount").dollars >= upgradePrice:
		get_node("../../../typeCount").dollars -= upgradePrice
		get_node("../../../settingsMenu/soundEffectPlayer")._soundEffectPlay("upgradeSound")
		get_node("../../kingTextInput").keymonkeyKing = true
		disabled = true
	else:
		get_node("../../../incorrectIndicator").cash = false
		get_node("../../../settingsMenu/soundEffectPlayer")._soundEffectPlay("mehSound")
