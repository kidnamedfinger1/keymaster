extends TextEdit
var totalKeymonkeys = 0
var keymonkeyGrunts = 0
var keymonkeySnipers = 0
var gruntLastType = -1
var sniperLastType = 0




func _process(delta):
	if totalKeymonkeys > 0:
		self.visible = true
	
	if keymonkeySnipers > 0:
		if lastType > (50/keymonkeySnipers) || lastType == -1:
			lastType = 0
			self.text += get_node("../keyDisplay")._generateString(get_node("../typeCount").score)
		else:
			lastType += 1
		if (self.text).length() > 10:
			self.text = ""
		
 	
	
	
	
	
	if keymonkeyGrunts > 0:
		if gruntLastType > (48/keymonkeyGrunts) || gruntLastType == -1:
			gruntLastType = 0
			self.text += get_node("../keyDisplay")._generateString(0)
		else:
			gruntLastType += 1
	if keymonkeySnipers > 0:
		if sniperLastType > (360/keymonkeySnipers):
			sniperLastType = 0
			self.text += get_node("../keyDisplay").goalText
		else:
			sniperLastType += 1
	if (self.text).length() > 20:
		self.text = (self.text).substr(1)
