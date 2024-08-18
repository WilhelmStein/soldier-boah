class_name ItemContainer extends StaticBody2D

signal open(position, direction)

@onready var spawn_direction: Vector2 = Vector2.DOWN.rotated(rotation)

var is_open: bool = false

# Pure func
func receive_hit():
	pass
