extends RichTextLabel
var letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", 
			   "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
var rng = RandomNumberGenerator.new()
var goalText = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	goalText = _generateString(get_node("../typeCount").score)
	self.text = "[font_size=50]" + goalText


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (get_node("../textInput").text == goalText) :
		var money = ((2 * len(goalText)) - get_node("../typeCount").deduction)
		if money <= 0 :
			money = 1
		get_node("../typeCount").dollars += money
		get_node("../typeCount").score += money
		get_node("../typeCount").deduction = 0
		goalText = _generateString(get_node("../typeCount").score)
		self.text = "[font_size=50]" + goalText
		get_node("../textInput").text = ""
		get_node("../settingsMenu/soundEffectPlayer")._soundEffectPlay("correctSound")
		get_node("../enemyDisplay").enemyChange = true
	elif (get_node("../keymonkeyMenu/keymonkeyTextInput").text.contains(goalText)):
		var money = 5 + pow(5, len(goalText))
		get_node("../typeCount").dollars += money
		get_node("../typeCount").score += 2 * len(goalText)
		get_node("../typeCount").deduction = 0
		get_node("../textInput").text = ""
		get_node("../keymonkeyMenu/keymonkeyTextInput").text = (get_node("../keymonkeyMenu/keymonkeyTextInput").text).replacen(goalText, "")
		goalText = _generateString(get_node("../typeCount").score)
		self.text = "[font_size=50]" + goalText
		get_node("../settingsMenu/soundEffectPlayer")._soundEffectPlay("keymonkeySound")
		get_node("../enemyDisplay").enemyChange = true
	elif (get_node("../keymonkeyMenu/kingTextInput").text.contains(goalText)):
		var money = 5 + (5 * get_node("../upgradeMenu/upgradeMenuIndicator/kingSpeed/kingSpeedModifier").stakesLevel)
		get_node("../typeCount").dollars += money
		get_node("../typeCount").score += 3 * len(goalText)
		get_node("../typeCount").deduction = 0
		get_node("../textInput").text = ""
		get_node("../keymonkeyMenu/kingTextInput").text = ""
		goalText = _generateString(get_node("../typeCount").score)
		self.text = "[font_size=50]" + goalText
		get_node("../settingsMenu/soundEffectPlayer")._soundEffectPlay("keymonkeySound")
		get_node("../enemyDisplay").enemyChange = true
	elif (get_node("../textInput").text != "" && len(get_node("../textInput").text) >= len(goalText)) :
		get_node("../settingsMenu/soundEffectPlayer")._soundEffectPlay("mehSound")
		get_node("../incorrectIndicator").incorrect = true
		get_node("../typeCount").deduction += 1
		get_node("../textInput").text = ""
	

func _generateString(correct: int, forceStringLength: int = -1) -> String:
	var stringLength = 0
	var lengthOdds = 50 + correct
	var randomLength = randi_range(0, lengthOdds)
	if randomLength > 100000:
		stringLength += 10
	elif randomLength > 50000:
		stringLength += 9
	elif randomLength > 22500:
		stringLength += 8
	elif randomLength > 10000:
		stringLength += 7
	elif randomLength > 4500:
		stringLength += 6
	elif randomLength > 2000:
		stringLength += 5
	elif randomLength > 1000:
		stringLength += 4
	elif randomLength > 500:
		stringLength += 3
	elif randomLength > 200:
		stringLength += 2
	else:
		stringLength += 1
	var randomString = ""
	if forceStringLength != -1:
		stringLength = forceStringLength
	for x in stringLength:
		randomString += (letters[rng.randi_range(0,25)])
	return randomString
