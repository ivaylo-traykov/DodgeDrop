extends Area2D
class_name Block

var rng = RandomNumberGenerator.new()
var speed = 7
var angle = 0
var scale_index = 1
var rotation_speed = 0.025
var rotation_direction = 0

@onready var sprite = $TextureRect

func _ready():
	rotation_direction = rng.randi_range(-1, 1)
	scale_index = rng.randf_range(0.5,2)
	scale = Vector2(scale_index, scale_index)
	z_index = -scale_index

func _process(delta):
	position.y += speed / scale_index
	angle += (rotation_speed / scale_index) * rotation_direction
	rotation = angle
	
	if position.y > 1024:
		die()

func _on_body_entered(body):
	if body is Player:
		print("Player got hit")
		die()
		
func die():
	queue_free()
