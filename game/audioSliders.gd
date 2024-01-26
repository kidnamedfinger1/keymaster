extends HSlider

var visibleMenu = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_settings_menu_pressed():
	if visibleMenu == false:
		visibleMenu = true
	elif visibleMenu == true:
		visibleMenu = false

func _process(delta):
	if visibleMenu == false:
		self.visible = false
		self.z_index = -1
	elif visibleMenu == true:
		self.z_index = 0
		self.visible = true
