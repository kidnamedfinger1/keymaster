extends RichTextLabel
var letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", 
			   "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
var rng = RandomNumberGenerator.new()
var goalText = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	goalText = _generateString(get_node("../typeCount").correct)
	self.text = "[font_size=300]" + goalText


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (get_node("../textInput").text == goalText) :
		get_node("../typeCount").correct += 1
		goalText = _generateString(get_node("../typeCount").correct)
		self.text = "[font_size=300]" + goalText
		get_node("../textInput").text = ""
	

func _generateString(correct: int) -> String:
	var stringLength = 0
	var lengthOdds = 50 + correct
	var randomLength = randi_range(0, lengthOdds)
	if randomLength > 100:
		stringLength += 3
	elif randomLength > 50:
		stringLength += 2
	else:
		stringLength += 1
	var randomString = ""
	for x in stringLength:
		randomString += (letters[rng.randi_range(0,25)])
	return randomString
