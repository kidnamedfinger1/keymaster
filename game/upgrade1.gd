extends Button
var upgradePrice = 10


func _on_pressed():
	get_node("../typeCount").dollars -= 10
