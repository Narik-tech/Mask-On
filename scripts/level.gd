class_name Level
extends Node2D

signal start_rotation()
signal stop_rotation()

var rotation_target: int = 0
var is_rotating: bool = false
func set_rotation_target(degrees: int):
	start_rotation.emit()
	SoundManager.woosh()
	is_rotating = true
	if abs(degrees) > 180:
		rotation_target = (-degrees + 180) %360
	else:
		rotation_target = degrees
	

func _process(delta: float) -> void:
	if not is_rotating: return
	var diff = roundi(rotation_target - global_rotation_degrees) %360
	if abs(diff) > 3:
		global_rotation = lerp_angle(global_rotation, float(deg_to_rad(rotation_target)), delta * 10)
	else:
		global_rotation_degrees = rotation_target
		stop_rotation.emit()
		is_rotating = false
		
		
		
