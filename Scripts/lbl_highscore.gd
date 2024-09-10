extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Highscore: " + str(Game.get_highscore())
