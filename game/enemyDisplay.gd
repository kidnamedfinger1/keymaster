extends AnimatedSprite2D
var enemyOptions = ["greenSlime", "normalSpider", "normalSkeleton", "normalZombie", "normalGoblin", "normalAlien", "enhancedSkeleton", "alienWizard"]
var enemyChange = false
func selectEnemy(cashLevel) -> String:
	var enemyRange = 5
	return enemyOptions[randi_range(0, enemyRange)]

func _ready():
	var enemy = selectEnemy(get_node("../typeCount").score)
	if enemy == "normalSkeleton":
		self.scale = Vector2(1, 1)
		self.position = Vector2(152, 336)
	elif enemy == "greenSlime":
		self.scale = Vector2(6, 6)
		self.position = Vector2(173, 423)
	elif enemy == "normalSpider":
		self.scale = Vector2(6,6)
		self.position = Vector2(180,430)
	elif enemy == "normalZombie":
		self.scale = Vector2(5.9,5.9)
		self.position = Vector2(165,345)
	elif enemy == "normalGoblin":
		self.scale = Vector2(5.9,5.9)
		self.position = Vector2(165,345)
	elif enemy == "normalAlien":
		self.scale = Vector2(4, 4)
		self.position = Vector2(203, 307)
	elif enemy == "alienWizard":
		self.scale = Vector2(4, 4)
		self.position = Vector2(203, 307)
	if enemy == "enhancedSkeleton":
		self.scale = Vector2(6, 6)
		self.position = Vector2(140, 336)
	self.play(enemy)



func _process(_delta):
	if enemyChange == true:
		var enemy = selectEnemy(get_node("../typeCount").score)
		enemyChange = false
		if enemy == "normalSkeleton":
			self.scale = Vector2(1, 1)
			self.position = Vector2(152, 336)
		elif enemy == "greenSlime":
			self.scale = Vector2(6, 6)
			self.position = Vector2(173, 423)
		elif enemy == "normalSpider":
			self.scale = Vector2(6,6)
			self.position = Vector2(180,430)
		elif enemy == "normalZombie":
			self.scale = Vector2(5.9,5.9)
			self.position = Vector2(165,345)
		elif enemy == "normalGoblin":
			self.scale = Vector2(5.9,5.9)
			self.position = Vector2(165,345)
		elif enemy == "normalAlien":
			self.scale = Vector2(4, 4)
			self.position = Vector2(203, 307)
		elif enemy == "alienWizard":
			self.scale = Vector2(4, 4)
			self.position = Vector2(203, 307)
		if enemy == "enhancedSkeleton":
			self.scale = Vector2(6, 6)
			self.position = Vector2(140, 336)
		self.play(enemy)
