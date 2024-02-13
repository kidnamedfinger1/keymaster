extends TextEdit
var totalKeymonkeys = 0
var keymonkeyGrunts = 0
var lastType = -1

func _process(delta):
	if totalKeymonkeys > 0:
		self.visible = true
	if keymonkeyGrunts > 0:
		if lastType > (120/keymonkeyGrunts) || lastType == -1:
			lastType = 0
			self.text += get_node("../keyDisplay")._generateString(0)
		else:
			lastType += 1
	if (self.text).length() > 20:
		self.text = (self.text).substr(1)
		
