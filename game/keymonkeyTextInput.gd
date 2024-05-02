extends TextEdit
var totalKeymonkeys = 0
var keymonkeyGrunts = 0
var keymonkeySnipers = 0
var keymonkeyBrutes = 0
var keymonkeyMages = 0
var gruntLastType = -1
var sniperLastType = 0
var bruteLastType = -1
var mageLastType = 0
var rng = RandomNumberGenerator.new()

func _process(delta):
	if totalKeymonkeys > 0:
		self.visible = true
		get_node("../keymonkeyClear").visible = true
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
	if keymonkeyBrutes > 0:
		if bruteLastType > (36/keymonkeyBrutes) || bruteLastType == -1:
			bruteLastType = 0
			self.text += get_node("../../keyDisplay")._generateString(0, len(get_node("../../keyDisplay").goalText))
		else:
			bruteLastType += 1
	if keymonkeyMages >= 1:
		if rng.randf_range(0.000,500.000) <= 0.2 * (sqrt((5 * keymonkeyMages * totalKeymonkeys) - 5)) + 1:
			self.text += get_node("../../keyDisplay").goalText
	if (self.text).length() > 20:
		self.text = (self.text).substr((self.text).length() - 20)
