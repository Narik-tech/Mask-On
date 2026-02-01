extends Control

@export var main_menu_scene: PackedScene
@export var main_menu_button: Button

func _ready():
	LevelManager.game_win.connect(activate_win_screen)

func activate_win_screen():
	visible = true
	main_menu_button.grab_focus()

func _on_main_menu_button_pressed():
	if main_menu_scene:
		get_tree().change_scene_to_packed(main_menu_scene)
	else:
		push_warning("main_menu_scene not set on PauseMenu")
