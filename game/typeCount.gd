extends Label
var correct = 0
func _process(delta):
	self.text = "Correct: " + str(correct)
