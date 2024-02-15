extends Label
var incorrect = false

func _process(delta):
	if incorrect == true :
		incorrect = false
		self.text = "INCORRECT INPUT, PAYOUT DEDUCTED"
		self.visible = true
		await get_tree().create_timer(1).timeout
		self.visible = false
	
	if get_node("../../keymonkeyMenu/keymonkeyMenuIndicator/keymonkeyGrunt").cash == false || get_node("../../keymonkeyMenu/keymonkeyMenuIndicator/keymonkeySniper").cash == false :
		get_node("../../keymonkeyMenu/keymonkeyMenuIndicator/keymonkeyGrunt").cash = true
		get_node("../../keymonkeyMenu/keymonkeyMenuIndicator/keymonkeySniper").cash = true
		self.text = "LACK OF FUNDS"
		self.visible = true
		await get_tree().create_timer(1).timeout
		self.visible = false

