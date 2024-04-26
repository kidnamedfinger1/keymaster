extends Label
var incorrect = false
var cash = true

func _process(delta):
	if incorrect == true :
		incorrect = false
		self.text = "INCORRECT INPUT, PAYOUT DEDUCTED"
		self.visible = true
		await get_tree().create_timer(1).timeout
		self.visible = false
	
	if cash == false:
		cash = true
		self.text = "LACK OF FUNDS"
		self.visible = true
		await get_tree().create_timer(1).timeout
		self.visible = false

