extends Label

func _process(delta):
	text = "Lives: " + str(Game.lives)
