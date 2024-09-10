extends Node

var rng = RandomNumberGenerator.new()
var time = 0
var spawn_ready = false
var item_scene = preload("res://Scenes/Drops/block.tscn")
var timer = null
var screen_width = 0

func _ready():
	timer = $spawn_cooldown
	screen_width = int(get_viewport().size.x)

func _process(delta):
	time += delta
	
	## SPAWN DROPS
	if spawn_ready:
		var item = item_scene.instantiate()
		var spawn_point = rng.randi() % screen_width
		item.position.y = -50
		item.position.x = spawn_point
		get_tree().root.add_child(item)
		spawn_ready = false
		timer.start()
		

func _on_spawn_cooldown_timeout():
	spawn_ready = true
