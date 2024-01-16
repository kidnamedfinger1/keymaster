extends Button
var upgradePrice = 10
var cash = true

func _on_pressed():
	if get_node("../typeCount").dollars >= 10:
		get_node("../typeCount").dollars -= 10
		get_node("../soundEffectPlayer")._soundEffectPlay("upgradeSound")
	else:
		cash = false
		get_node("../soundEffectPlayer")._soundEffectPlay("mehSound")

