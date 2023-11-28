extends RichTextLabel
var letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", 
			   "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
var rng = RandomNumberGenerator.new()
var randomLetter = letters[rng.randi_range(0,25)]
# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = "[font_size=300]" + randomLetter


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (get_node("../textInput").text == randomLetter) :
		get_node("../typeCount").correct += 1
		randomLetter= letters[rng.randi_range(0,25)]
		self.text = "[font_size=300]" + randomLetter
		get_node("../textInput").text = ""
	
