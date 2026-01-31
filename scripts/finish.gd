extends Area2D

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		call_deferred("collide_with_player", body)

func collide_with_player(player: Node):
	LevelManager.level_complete()
