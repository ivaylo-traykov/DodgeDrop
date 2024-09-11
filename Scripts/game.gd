extends Node

const HIGHSCORE = "res://highscore.bin"

var lives = 3
var score = 0
var player_protected = false
var player_protected_cooldown = 1.5

func _process(delta):
	if player_protected:
		player_protected_cooldown -= delta
	
	if player_protected_cooldown <= 0:
		player_protected = false

func player_get_hit():
	if not player_protected:
		player_protected = true
		player_protected_cooldown = 1.5
		lives -= 1
		if lives <= 0:
			await get_tree().create_timer(1).timeout 
			set_highscore()
			game_over()

func get_difficulty():
	return floor(score / 500)

func set_highscore():
	if score > get_highscore():
		var file = FileAccess.open(HIGHSCORE, FileAccess.WRITE)
		file.store_line(str(score))

func get_highscore():
	if FileAccess.file_exists(HIGHSCORE):
		var file = FileAccess.open(HIGHSCORE, FileAccess.READ)
		if not file.eof_reached():
			var current_line = file.get_line()
			if int(current_line) > 0:
				return int(current_line)
			else:
				return 0
		file.close()

func game_over():
	get_tree().change_scene_to_file("res://Scenes/main_screen.tscn")
