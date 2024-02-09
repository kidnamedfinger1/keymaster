extends AnimatedSprite2D
var enemyOptions = ["greenSlime", "normalSpider", "normalSkeleton", "normalZombie", "normalGoblin", "alienWizard"]
var enemyChange = false
var fullScr = false
var fullScrSwitch = false
func selectEnemy(cashLevel) -> String:
	var enemyRange = 4
	return enemyOptions[randi_range(0, enemyRange)]

func _on_fullscreenToggle_pressed():
	if fullScr == false :
		fullScr = true
		fullScrSwitch = true
	elif  fullScr == true :
		fullScr = false
		fullScrSwitch = true

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
		self.scale = Vector2(5,5)
		self.position = Vector2(150,330)
	elif enemy == "normalGoblin":
		self.scale = Vector2(5.9,5.9)
		self.position = Vector2(165,345)
	self.play(enemy)



func _process(_delta):
	if fullScr == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		if fullScrSwitch == true:
			enemyChange = true
			fullScrSwitch = false
		if enemyChange == true:
			var enemy = selectEnemy(get_node("../typeCount").score)
			enemyChange = false
			if enemy == "normalSkeleton":
				self.scale = Vector2(1, 1) * 2
				self.position = Vector2(152, 336) * 2
			elif enemy == "greenSlime":
				self.scale = Vector2(6, 6) * 2
				self.position = Vector2(173, 423) * 2
			elif enemy == "normalSpider":
				self.scale = Vector2(6,6) * 2
				self.position = Vector2(180,430) * 2
			elif enemy == "normalZombie":
				self.scale = Vector2(5.9,5.9) * 2
				self.position = Vector2(165,345) * 2
			elif enemy == "normalGoblin":
				self.scale = Vector2(5.9,5.9) * 2
				self.position = Vector2(165,345) * 2
			elif enemy == "alienWizard":
				self.scale = Vector2(4, 4) * 2
				self.position = Vector2(203, 307) * 2
			self.play(enemy)
	elif fullScr == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		if fullScrSwitch == true:
			enemyChange = true
			fullScrSwitch = false
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
			elif enemy == "alienWizard":
				self.scale = Vector2(4, 4)
				self.position = Vector2(203, 307)
			self.play(enemy)
