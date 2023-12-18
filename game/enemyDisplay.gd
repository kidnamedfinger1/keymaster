extends AnimatedSprite2D
var enemyOptions = ["greenSlime", "normalSkeleton", "alienWizard"]
var enemyChange = false
func selectEnemy(cashLevel) -> String:
	var enemyRange = 1
	if cashLevel >= 500:
		enemyRange += 1
	return enemyOptions[randi_range(0, enemyRange)]
	
# Called when the node enters the scene tree for the first time.
func _ready():
	var enemy = selectEnemy(get_node("../typeCount").score)
	if enemy == "normalSkeleton":
		self.scale = Vector2(1, 1)
		self.position = Vector2(152, 336)
	elif enemy == "greenSlime":
		self.scale = Vector2(6, 6)
		self.position = Vector2(173, 423)
	self.play(enemy)
	
func _process(delta):
	if enemyChange == true:
		var enemy = selectEnemy(get_node("../typeCount").score)
		enemyChange = false
		if enemy == "normalSkeleton":
			self.scale = Vector2(1, 1)
			self.position = Vector2(152, 336)
		elif enemy == "greenSlime":
			self.scale = Vector2(6, 6)
			self.position = Vector2(173, 423)
		elif enemy == "alienWizard":
			self.scale = Vector2(4, 4)
			self.position = Vector2(203, 307)
		self.play(enemy)
