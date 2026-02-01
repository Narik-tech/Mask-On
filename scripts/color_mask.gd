extends Area2D

var mask_activated: bool = false
@export var tile_group: String

func _on_body_entered(body: Node) -> void:
	if mask_activated: return
	if body.is_in_group("player"):
		call_deferred("collide_with_player", body)

func collide_with_player(player: Node):
	get_parent().remove_child(self)
	player.add_mask(self)
	activate_mask()

func activate_mask():
	SoundManager.slide()
	mask_activated = true
	if get_tree() == null: return
	for tile in get_tree().get_nodes_in_group(tile_group):
		tile.activate()

func deactivate_mask():
	SoundManager.slide()
	if not is_inside_tree(): return
	for tile in get_tree().get_nodes_in_group(tile_group):
		tile.deactivate()
