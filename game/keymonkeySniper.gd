extends Button
var upgradePrice = 100
var cash = true
var visibleMenu = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visibleMenu == false:
		self.visible == false
	elif visibleMenu == true:
		self.visible == true


#func _on_keymonkey_menu_pressed():
#	if visibleMenu == false:
#		visibleMenu == true
#	elif visibleMenu == true:
#		visibleMenu == false

