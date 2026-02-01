extends Node

signal game_win()

@export var levels := [
	"res://levels/level_1.tscn",
	"res://levels/level_2.tscn",
	"res://levels/level_3.tscn",
]
var current_level_index := 0

func start_game():
	current_level_index = 0
	get_tree().change_scene_to_file(levels[current_level_index])

func level_complete():
	var next_index := current_level_index + 1
	if next_index < levels.size():
		get_tree().change_scene_to_file(levels[next_index])
		current_level_index = next_index
	else:
		game_win.emit()
