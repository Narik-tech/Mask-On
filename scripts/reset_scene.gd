extends Button

func _pressed() -> void:
	get_tree().reload_current_scene()

func _process(delta: float) -> void:
	if Input.is_action_pressed("reset"):
		_pressed()
