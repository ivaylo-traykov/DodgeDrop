extends Area2D

var speed = 10

func _process(delta):
	position.y += speed
	
	if Game.lives <= 0 or position.y > 1024:
		queue_free()

func _on_body_entered(body):
	if body is Player:
		Game.score += 150
		queue_free()
