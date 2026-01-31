extends CharacterBody2D

@export var speed: float = 200.0
@export var jump_velocity: float = -400.0
@export var gravity: float = 1200.0
@export var mask_transform: Node2D
var current_mask = null

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed

	move_and_slide()

func add_mask(mask):
	if current_mask != null: current_mask.queue_free()
	add_child(mask)
	(mask as Node2D).transform = mask_transform.transform
	current_mask = mask

func _process(delta: float) -> void:
	global_rotation = 0

	if current_mask != null:
		(current_mask as Node2D).transform = mask_transform.transform
