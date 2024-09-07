extends CharacterBody2D

var speed = 300
var drift = 30

func _process(delta):
	
	var direction = Input.get_axis("ui_left", "ui_right")
	
	# Basic left and right movement
	if direction:
		velocity.x = move_toward(velocity.x, speed * direction, drift)
	else:
		velocity.x = move_toward(velocity.x, 0, drift)

	# Warp player from the side of the screen
	if position.x < 0:
		position.x = 720
	elif position.x > 720:
		position.x = 0

	move_and_slide()
