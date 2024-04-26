extends Label

var speedUpgrade = 1000
var sightUpgrade = 1000
var strengthUpgrade = 1000
var stakesUpgrade = 10000
var swagUpgrade = 100000

var speedLevel = 1
var sightLevel = 1
var strengthLevel = 1
var stakesLevel = 1
var swagLevel = 1

func _process(_delta):
	get_node("../../kingSpeed/kingSpeedCost").text = "$" + str(speedUpgrade)
	get_node("../../kingSight/kingSightCost").text = "$" + str(sightUpgrade)
	get_node("../../kingStrength/kingStrengthCost").text = "$" + str(strengthUpgrade)
	get_node("../../kingStakes/kingStakesCost").text = "$" + str(stakesUpgrade)
	get_node("../../kingSwag/kingSwagCost").text = "$" + str(swagUpgrade)
	get_node("../../kingSpeed/kingSpeedModifier").text = "Lvl " + str(speedLevel)
	get_node("../../kingSight/kingSightModifier").text = "Lvl " + str(sightLevel)
	get_node("../../kingStrength/kingStrengthModifier").text = "Lvl " + str(strengthLevel)
	get_node("../../kingStakes/kingStakesModifier").text = "Lvl " + str(stakesLevel)
	get_node("../../kingSwag/kingSwagModifier").text = "Lvl " + str(swagLevel)
