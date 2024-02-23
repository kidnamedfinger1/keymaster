extends TextEdit
var totalKeymonkeys = 0
var keymonkeyGrunts = 0
var keymonkeySnipers = 0
var gruntLastType = -1
var sniperLastType = 0
var rng = RandomNumberGenerator.new()

func _process(delta):
	if totalKeymonkeys > 0:
		self.visible = true
	if keymonkeyGrunts > 0:
		if gruntLastType > (48/keymonkeyGrunts) || gruntLastType == -1:
			gruntLastType = 0
			self.text += get_node("../../keyDisplay")._generateString(0)
		else:
			gruntLastType += 1
	if keymonkeySnipers > 0:
		if sniperLastType > (360/keymonkeySnipers):
			sniperLastType = 0
			self.text += get_node("../../keyDisplay").goalText[rng.randi_range(0,(len(get_node("../../keyDisplay").goalText)) - 1)]
		else:
			sniperLastType += 1
	if (self.text).length() > 20:
		self.text = (self.text).substr(1)
