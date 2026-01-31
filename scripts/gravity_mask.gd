@tool
extends Area2D

@export var rotation_amount: int
@export var gravity_arrow: Sprite2D

var level: Node2D
var mask_activated: bool = false

func _ready() -> void:
	if Engine.is_editor_hint(): return
	level = get_tree().get_first_node_in_group("level")
	tree_exiting.connect(deactivate_mask)

func _on_body_entered(body: Node) -> void:
	if mask_activated: return
	if body.is_in_group("player"):
		call_deferred("collide_with_player", body)

func collide_with_player(player: Node):
	get_parent().remove_child(self)
	player.add_mask(self)
	activate_mask()

func activate_mask():
	mask_activated = true
	level.set_rotation_target(-float(rotation_amount))
	if get_tree() == null: return

func deactivate_mask():
	if not is_inside_tree(): return

func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		gravity_arrow.global_rotation_degrees = rotation_amount
	else: gravity_arrow.global_rotation_degrees = level.global_rotation_degrees + rotation_amount
