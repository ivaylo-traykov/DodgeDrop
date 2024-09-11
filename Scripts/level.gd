extends Node

var rng = RandomNumberGenerator.new()
var spawn_ready = false
var item_scene = preload("res://Scenes/Drops/block.tscn")
var timer = null
var screen_width = 0

var difficulty = Game.get_difficulty()

func _ready():
	timer = $spawn_cooldown
	screen_width = int(get_viewport().size.x)

func _process(delta):
	## UPDATE DIFICULTY
	if difficulty != Game.get_difficulty() and timer.wait_time > 0.1:
		timer.wait_time -= 0.1
		difficulty = Game.get_difficulty()
	
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
