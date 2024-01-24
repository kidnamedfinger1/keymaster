extends TextEdit
var totalKeymonkeys = 0

func _process(delta):
	if totalKeymonkeys > 0:
		self.visible = true
