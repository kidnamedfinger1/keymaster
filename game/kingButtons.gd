extends Button


func _on_king_speed_pressed():
	if get_node("../../../typeCount").dollars >= get_node("kingSpeedModifier").speedCost:
		get_node("../../../typeCount").dollars -= get_node("kingSpeedModifier").speedCost
		get_node("../../../settingsMenu/soundEffectPlayer")._soundEffectPlay("upgradeSound")
		get_node("kingSpeedModifier").speedLevel += 1
		get_node("kingSpeedModifier").speedCost += (25 * (get_node("kingSpeedModifier").speedLevel * 10))
	else:
		get_node("../../../incorrectIndicator").cash = false
		get_node("../../../settingsMenu/soundEffectPlayer")._soundEffectPlay("mehSound")


func _on_king_sight_pressed():
	if get_node("../../../typeCount").dollars >= get_node("../kingSpeed/kingSpeedModifier").sightCost:
		get_node("../../../typeCount").dollars -= get_node("../kingSpeed/kingSpeedModifier").sightCost
		get_node("../../../settingsMenu/soundEffectPlayer")._soundEffectPlay("upgradeSound")
		get_node("../kingSpeed/kingSpeedModifier").sightLevel += 1
		get_node("../kingSpeed/kingSpeedModifier").sightCost += (25 * (get_node("../kingSpeed/kingSpeedModifier").sightLevel * 100))
	else:
		get_node("../../../incorrectIndicator").cash = false
		get_node("../../../settingsMenu/soundEffectPlayer")._soundEffectPlay("mehSound")


func _on_king_strength_pressed():
	if get_node("../../../typeCount").dollars >= get_node("../kingSpeed/kingSpeedModifier").strengthCost:
		get_node("../../../typeCount").dollars -= get_node("../kingSpeed/kingSpeedModifier").strengthCost
		get_node("../../../settingsMenu/soundEffectPlayer")._soundEffectPlay("upgradeSound")
		get_node("../kingSpeed/kingSpeedModifier").strengthLevel += 1
		get_node("../kingSpeed/kingSpeedModifier").strengthCost += (25 * (get_node("../kingSpeed/kingSpeedModifier").strengthLevel * 50))
	else:
		get_node("../../../incorrectIndicator").cash = false
		get_node("../../../settingsMenu/soundEffectPlayer")._soundEffectPlay("mehSound")


func _on_king_stakes_pressed():
	if get_node("../../../typeCount").dollars >= get_node("../kingSpeed/kingSpeedModifier").stakesCost:
		get_node("../../../typeCount").dollars -= get_node("../kingSpeed/kingSpeedModifier").stakesCost
		get_node("../../../settingsMenu/soundEffectPlayer")._soundEffectPlay("upgradeSound")
		get_node("../kingSpeed/kingSpeedModifier").stakesLevel += 1
		get_node("../kingSpeed/kingSpeedModifier").stakesCost += (25 * (get_node("../kingSpeed/kingSpeedModifier").stakesLevel * 150))
	else:
		get_node("../../../incorrectIndicator").cash = false
		get_node("../../../settingsMenu/soundEffectPlayer")._soundEffectPlay("mehSound")


func _on_king_swag_pressed():
	if get_node("../../../typeCount").dollars >= get_node("../kingSpeed/kingSpeedModifier").swagCost:
		get_node("../../../typeCount").dollars -= get_node("../kingSpeed/kingSpeedModifier").swagCost
		get_node("../../../settingsMenu/soundEffectPlayer")._soundEffectPlay("upgradeSound")
		get_node("../kingSpeed/kingSpeedModifier").swagLevel += 1
		get_node("../kingSpeed/kingSpeedModifier").swagCost += (25 * (get_node("../kingSpeed/kingSpeedModifier").swagLevel * 200))
	else:
		get_node("../../../incorrectIndicator").cash = false
		get_node("../../../settingsMenu/soundEffectPlayer")._soundEffectPlay("mehSound")
