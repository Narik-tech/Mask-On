extends Button

func _ready() -> void:
	grab_focus()

func _pressed():
	LevelManager.start_game()
