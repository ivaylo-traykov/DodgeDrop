extends CharacterBody2D
class_name Player

var speed = 300
var drift = speed / 10
var death_effect_scene = preload("res://Scenes/player_death_effect.tscn")


func _process(delta):
	
	if Game.lives <= 0:
		die()
	
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

func die():
	var death_effect = death_effect_scene.instantiate()
	death_effect.position = position
	get_tree().root.add_child(death_effect)
	queue_free()
