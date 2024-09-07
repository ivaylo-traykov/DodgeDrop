extends CharacterBody2D

var speed = 300
var drift = 30

func _process(delta):
	
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * speed
		
	else:
		velocity.x = move_toward(velocity.x, 0, drift)

	move_and_slide()
