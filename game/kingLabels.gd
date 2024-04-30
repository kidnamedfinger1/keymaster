extends Label

var speedLevel = 1
var speedCost = 10000
var sightLevel = 1
var sightCost = 10000
var strengthLevel = 1
var strengthCost = 10000
var stakesLevel = 1
var stakesCost = 100000
var swagLevel = 1
var swagCost = 1000000

func _process(delta):
	self.text = "Lvl " + str(speedLevel)
	get_node("../kingSpeedCost").text = "$" + str(speedCost)
	get_node("../../kingSight/kingSightModifier").text = "Lvl " + str(sightLevel)
	get_node("../../kingSight/kingSightCost").text = "$" + str(sightCost)
	get_node("../../kingStrength/kingStrengthModifier").text = "Lvl " + str(strengthLevel)
	get_node("../../kingStrength/kingStrengthCost").text = "$" + str(strengthCost)
	get_node("../../kingStakes/kingStakesModifier").text = "Lvl " + str(stakesLevel)
	get_node("../../kingStakes/kingStakesCost").text = "$" + str(stakesCost)
	get_node("../../kingSwag/kingSwagModifier").text = "Lvl " + str(swagLevel)
	get_node("../../kingSwag/kingSwagCost").text = "$" + str(swagCost)
