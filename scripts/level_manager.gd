extends Node

@export var levels := [
	"res://levels/level_1.tscn",
	"res://levels/level_2.tscn",
	"res://levels/level_3.tscn",
]
#var level_folder = "res://levels"
var current_level_index := 0

#func _ready():
	## Load all level scene paths from res://levels
	#var dir := DirAccess.open(level_folder)
	#if dir:
		#dir.list_dir_begin()
		#var file_name = dir.get_next()
		#while file_name != "":
			#print_debug("file found: " + file_name)
			#if not dir.current_is_dir() and file_name.ends_with(".tscn"):
				#print_debug("level found: " + level_folder + "/" + file_name)
				#levels.append(level_folder + "/" + file_name)
			#file_name = dir.get_next()
		#dir.list_dir_end()
	#else:
		#print_debug("could not open dir")
#
	#levels.sort()
#
	## Detect current level
	#var current_scene_path := get_tree().current_scene.scene_file_path
	#current_level_index = levels.find(current_scene_path)

func level_complete():
	var next_index := current_level_index + 1
	if next_index < levels.size():
		get_tree().change_scene_to_file(levels[next_index])
		current_level_index = next_index
	else:
		print("No more levels")
