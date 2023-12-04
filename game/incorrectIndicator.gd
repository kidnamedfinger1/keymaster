extends Label
var incorrect = 0

func _process(delta):
	if incorrect >= 0 :
		self.text = "INCORRECT INPUT, PAYOUT DEDUCTED"
		self.visible = true
		incorrect -= 1
	else :
		self.visible = false


