class_name BaseLevel extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_player_laser(pos, dir):
	var laser: Laser = laser_scene.instantiate() as Laser
	laser.position = pos
	laser.rotation = dir.angle()
	laser.direction = dir
	$Projectiles.add_child(laser)
	$UI.update_laser_text()

func _on_player_grenade(pos, dir):
	var grenade: RigidBody2D = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = dir * grenade.speed
	$Projectiles.add_child(grenade)
	$UI.update_grenade_text()

func _on_house_player_entered():
	var tween: Tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1,1), 1).set_trans(Tween.TRANS_QUAD)

func _on_house_player_exited():
	var tween: Tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6,0.6), 1)
