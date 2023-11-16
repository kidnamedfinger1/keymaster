extends Label

var letters = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
var randomIndex : String
var points = 0

func makeletter():
	randomIndex = letters[randi() % letters.size()]
	set_text(randomIndex)

func _ready():
	makeletter()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and OS.get_keycode_string(event.key_label) == randomIndex:
			points += 1
			makeletter()
