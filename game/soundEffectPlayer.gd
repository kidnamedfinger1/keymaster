extends AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	self.stream = load("res://game/audio/buttonSelectPositive.wav")
	self.play()

func _soundEffectPlay(effect: String):
	if effect == "goodSound":
		self.stream = load("res://game/audio/buttonSelectPositive.wav")
	elif effect == "correctSound":
		self.stream = load("res://game/audio/upgradeNoise.wav")
	elif effect == "mehSound":
		self.stream = load("res://game/audio/buttonSelectMedium.wav")
	elif effect == "upgradeSound":
		self.stream = load("res://game/audio/quickGoodNoise.wav")
	elif effect == "keymonkeySound":
		if get_node("../../keymonkeyMenu/keymonkeyTextInput").gruntLastType == 0:
			self.stream = load("res://game/audio/gruntNoise.wav")
		elif get_node("../../keymonkeyMenu/keymonkeyTextInput").sniperLastType == 0:
			self.stream = load("res://game/audio/gruntNoise.wav")
		elif get_node("../../keymonkeyMenu/keymonkeyTextInput").bruteLastType == 0:
			self.stream = load("res://game/audio/gruntNoise.wav")
		elif get_node("../../keymonkeyMenu/keymonkeyTextInput").sniperLastType == 0:
			self.stream = load("res://game/audio/gruntNoise.wav")
		elif get_node("../../keymonkeyMenu/kingTextInput").kingLastType == 0:
			self.stream = load("res://game/audio/gruntNoise.wav")
	self.play()
