extends AudioStreamPlayer

var goodSound = preload("res://game/audio/buttonSelectPositive.wav")
var mehSound = preload("res://game/audio/buttonSelectMedium.wav")
var badSound = preload("res://game/audio/buttonSelectNegative.wav")
var correctSound = preload("res://game/audio/quickGoodNoise.wav")
var upgradeSound = preload("res://game/audio/upgradeNoise.wav")

var currentSound = null
# Called when the node enters the scene tree for the first time.
func _ready():
	currentSound = goodSound
	self.stream = currentSound
	self.play()
	self.stream = null

func _soundEffectPlay(effect: String):
	if effect == "goodSound":
		currentSound = goodSound
	elif effect == "correctSound":
		currentSound = correctSound
	elif effect == "mehSound":
		currentSound = mehSound
	elif effect == "upgradeSound":
		currentSound = "upgradeSound"
	self.stream = currentSound
	self.play()
	self.stream = null
