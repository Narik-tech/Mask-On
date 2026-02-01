extends Control

@export var main_menu_scene: PackedScene
@export var resume_button: Button

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	visible = false
	LevelManager.game_win.connect(_on_win_screen)

func _on_win_screen():
	queue_free()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_viewport().set_input_as_handled()
		_toggle_pause()

func _toggle_pause() -> void:
	var paused := not get_tree().paused
	get_tree().paused = paused
	visible = paused
	if paused: resume_button.grab_focus()

func _on_resume_button_pressed() -> void:
	_set_unpaused()

func _on_main_menu_button_pressed() -> void:
	_set_unpaused()
	if main_menu_scene:
		get_tree().change_scene_to_packed(main_menu_scene)
	else:
		push_warning("main_menu_scene not set on PauseMenu")

func _set_unpaused() -> void:
	get_tree().paused = false
	visible = false
