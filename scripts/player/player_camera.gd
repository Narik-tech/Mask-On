extends Camera2D

func _ready():
	if get_parent() is Node2D:
		global_position = get_parent().global_position
