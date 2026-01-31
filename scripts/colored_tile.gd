extends Node2D

@export var collider: CollisionShape2D 

func _ready() -> void:
	deactivate()

func activate():
	modulate.a = 1.0
	collider.disabled = false

func deactivate():
	modulate.a = 0.25   # use 0.0 for fully invisible
	collider.disabled = true
