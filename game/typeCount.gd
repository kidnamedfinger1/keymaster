extends Label
var dollars = 0
var score = 0
var deduction = 0
func _process(delta):
	self.text = "$" + str(dollars)
