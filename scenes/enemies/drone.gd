extends CharacterBody2D


@export var speed: float = 300.0

func _process(_delta):
	
	# direction
	var direction: Vector2 = Vector2.RIGHT
	
	# velocity
	velocity = direction * speed
	
	move_and_slide()

func receive_hit():
	pass
