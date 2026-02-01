extends CharacterBody2D

@export var speed: float = 200.0
@export var jump_velocity: float = -400.0
@export var gravity: float = 1200.0
@export var mask_transform: Node2D
@export var animated_sprite: AnimatedSprite2D

var current_mask: Node2D = null

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	# Horizontal movement
	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed

	# Sprite facing + animation
	if animated_sprite:
		if direction != 0.0:
			animated_sprite.flip_h = direction < 0.0
			if animated_sprite.animation != "walk":
				animated_sprite.play("walk")
		else:
			# Use whatever your idle animation is called.
			# If you don't have one, you can remove these two lines.
			if animated_sprite.animation != "idle":
				animated_sprite.play("idle")

	move_and_slide()

func add_mask(mask) -> void:
	if current_mask != null:
		current_mask.queue_free()
	add_child(mask)
	(mask as Node2D).transform = mask_transform.transform
	current_mask = mask

func _process(delta: float) -> void:
	# Keep the character upright
	global_rotation = 0.0

	# Keep mask aligned with the transform reference
	if current_mask != null:
		current_mask.transform = mask_transform.transform
