extends RichTextLabel
var letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", 
			   "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
var rng = RandomNumberGenerator.new()
var goalText = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	goalText = _generateString(get_node("../typeCount").dollars)
	self.text = "[font_size=200]" + goalText


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (get_node("../textInput").text == goalText) :
		var money = (5 + (5*len(goalText)) - get_node("../typeCount").deduction)
		if money <= 0 :
			money = 1
		get_node("../typeCount").dollars += money
		get_node("../typeCount").deduction = 0
		goalText = _generateString(get_node("../typeCount").dollars)
		self.text = "[font_size=200]" + goalText
		get_node("../textInput").text = ""
	elif (get_node("../textInput").text != "" && len(get_node("../textInput").text) >= len(goalText)) :
		get_node("../incorrectIndicator").incorrect = 60
		get_node("../typeCount").deduction += 1
		get_node("../textInput").text = ""
	

func _generateString(correct: int) -> String:
	var stringLength = 0
	var lengthOdds = 50 + correct
	var randomLength = randi_range(0, lengthOdds)
	if randomLength > 500:
		stringLength += 3
	elif randomLength > 200:
		stringLength += 2
	else:
		stringLength += 1
	var randomString = ""
	for x in stringLength:
		randomString += (letters[rng.randi_range(0,25)])
	return randomString
