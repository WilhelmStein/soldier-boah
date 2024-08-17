extends Area2D
class_name Laser

@export var speed: int = 2000
var direction: Vector2 = Vector2.UP

func _process(delta):
	position += direction * speed * delta


func _on_body_entered(body):
	if "receive_hit" in body:
		body.receive_hit()
	
	queue_free()


func _on_destruction_timer_timeout():
	queue_free()
