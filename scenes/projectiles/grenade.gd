extends RigidBody2D

const speed = 1000

func explode():
	$Explosion.visible = true
	$AnimationPlayer.play("explosion")
