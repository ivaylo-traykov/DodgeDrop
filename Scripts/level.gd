extends Node

var powerup_scenes = [
	preload("res://Scenes/Powerups/powerup_shield.tscn"),
	preload("res://Scenes/Powerups/powerup_life.tscn"),
	preload("res://Scenes/Powerups/powerup_points.tscn"),
	preload("res://Scenes/Powerups/powerup_speed.tscn")
]

var rng = RandomNumberGenerator.new()
var spawn_ready = false
var item_scene = preload("res://Scenes/Drops/block.tscn")
#var powerup_scene = powerup_scenes[rng.randi_range(0,1)]
var timer = null
var screen_width = 0

var difficulty = Game.get_difficulty()

func _ready():
	timer = $spawn_cooldown
	screen_width = int(get_viewport().size.x)

func _process(delta):
	## UPDATE DIFICULTY
	if difficulty != Game.get_difficulty() and timer.wait_time > 0.2:
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
		
		if rng.randi_range(1,100) < 8:
			var powerup_scene = powerup_scenes[rng.randi_range(0,len(powerup_scenes) - 1)]
			var powerup = powerup_scene.instantiate()
			spawn_point = rng.randi() % screen_width
			powerup.position.y = -50
			powerup.position.x = spawn_point
			get_tree().root.add_child(powerup)
		

func _on_spawn_cooldown_timeout():
	spawn_ready = true
