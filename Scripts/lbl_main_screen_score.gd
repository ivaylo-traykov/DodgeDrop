extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	if Game.score > 0:
		text = "Score: " + str(Game.score) + "\n"
	text += "Highscore: " + str(Game.get_highscore())
