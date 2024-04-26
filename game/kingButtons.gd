extends Button


func _on_king_speed_pressed():
	if get_node("../../../typeCount").dollars >= get_node("kingSpeedModifier").speedUpgrade:
		get_node("../../../typeCount").dollars -= get_node("kingSpeedModifier").speedUpgrade
		get_node("../../../settingsMenu/soundEffectPlayer")._soundEffectPlay("upgradeSound")
		get_node("kingSpeedModifier").speedLevel += 1
		get_node("kingSpeedModifier").speedUpgrade += (5 * (get_node("kingSpeedModifier").speedLevel * 2))
	else:
		get_node("../../../incorrectIndicator").cash = false
		get_node("../../../settingsMenu/soundEffectPlayer")._soundEffectPlay("mehSound")
