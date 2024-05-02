extends TextEdit
var keymonkeyKing = false
var kingLastType = 0
var rng = RandomNumberGenerator.new()

func _process(delta):
	if keymonkeyKing == true:
		self.visible = true
		get_node("../keymonkeyClear").visible = true
		var trueKingSpeed = 44 - (get_node("../../upgradeMenu/upgradeMenuIndicator/kingSpeed/kingSpeedModifier").speedLevel / 3)
		if trueKingSpeed < 1:
			trueKingSpeed = 1
		if kingLastType > trueKingSpeed:
			kingLastType = 0
			if rng.randf_range(0.000,500.000) <= 0.2 * (sqrt(25 * get_node("../../upgradeMenu/upgradeMenuIndicator/kingSpeed/kingSpeedModifier").sightLevel) - 5) + 1:
				self.text += get_node("../../keyDisplay").goalText
			else:
				self.text += get_node("../../keyDisplay")._generateString(100 * get_node("../../upgradeMenu/upgradeMenuIndicator/kingSpeed/kingSpeedModifier").strengthLevel)
		else:
			kingLastType += 1
	if (self.text).length() > 20:
		self.text = (self.text).substr((self.text).length() - 20)
