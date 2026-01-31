extends RigidBody2D

var saved_transform

func _ready():
	var level: Level = get_tree().get_first_node_in_group("level")
	level.start_rotation.connect(freeze_movement)
	level.stop_rotation.connect(unfreeze_movement)
	
	
func freeze_movement():
	saved_transform = transform
	freeze = true

func unfreeze_movement():
	call_deferred("unfreeze_movement_deferred")

func unfreeze_movement_deferred():
	linear_velocity = Vector2.ZERO  
	angular_velocity = 0
	transform = saved_transform
	saved_transform = null
	freeze = false
	await get_tree().process_frame
	print_debug()
