extends TextEdit
var totalKeymonkeys = 0
var keymonkeyGrunts = 0
var keymonkeySnipers = 0
var lastType = -1



func _process(delta):
	if totalKeymonkeys > 0:
		self.visible = true
	
	if keymonkeySnipers > 0:
		if lastType > (50/keymonkeySnipers) || lastType == -1:
			lastType = 0
			self.text += get_node("../keyDisplay").goalText
		else:
			lastType += 1
		if (self.text).length() > 10:
			self.text = ""
		
 	
	
	
	
	
	if keymonkeyGrunts > 0:
		if lastType > (120/keymonkeyGrunts) || lastType == -1:
			lastType = 0
			self.text += get_node("../keyDisplay")._generateString(0)
		else:
			lastType += 1
	if (self.text).length() > 20:
		self.text = (self.text).substr(1)
		
