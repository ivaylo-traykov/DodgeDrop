extends Node2D

func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/level.tscn")

func _on_quit_game_pressed():
	get_tree().quit()
