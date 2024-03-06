extends HSlider

func _process(delta):
	if get_node("../sfxSlider").value == 0:
		get_node("../../soundEffectPlayer").volume_db = -1000
	else:
		get_node("../../soundEffectPlayer").volume_db = -18.432 + (0.2 * (get_node("../sfxSlider").value - 50))
	if get_node("../musicSlider").value == 0:
		get_node("../../musicPlayer").volume_db = -1000
	else:
		get_node("../../musicPlayer").volume_db = -28.543 + (0.2 * (get_node("../musicSlider").value - 50))
