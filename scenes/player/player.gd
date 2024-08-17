extends CharacterBody2D

signal laser(position, direction)
signal grenade(position, direction)

@export var max_speed: int = 500
var speed: int = max_speed
@export var laser_timer_duration_secs: float = 0.5
@export var grenade_timer_duration_secs: float = 2.0

@onready var laser_timer: Timer = $LaserTimer
@onready var grenade_timer: Timer = $GrenadeTimer

var can_laser: bool = true
var can_grenade: bool = true

func _process(_delta):
	# movement
	var new_pos: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var new_velocity: Vector2 = new_pos * speed
	
	velocity = new_velocity
	
	move_and_slide()
	
	# rotate
	look_at(get_global_mouse_position())

func _unhandled_input(event: InputEvent):
	if event is InputEventMouse:
		var player_direction = (get_global_mouse_position() - position).normalized()
		
		if event.is_action_pressed("left_click") and can_laser and Globals.laser_amount > 0:
			Globals.laser_amount -= 1
			$GPUParticles2D.emitting = true
			var laser_markers = $LaserStartPositions.get_children()
			var selected_laser = laser_markers[randi() % laser_markers.size()]
			can_laser = false
			laser_timer.start(laser_timer_duration_secs)
			laser.emit(selected_laser.global_position, player_direction)
		elif event.is_action_pressed("right_click") and can_grenade and Globals.grenade_amount > 0:
			Globals.grenade_amount -= 1
			can_grenade = false
			grenade_timer.start(grenade_timer_duration_secs)
			var laser_markers = $LaserStartPositions.get_children()
			var pos_marker = laser_markers[randi() % laser_markers.size()].global_position
			grenade.emit(pos_marker, player_direction)

func _on_grenade_timer_timeout():
	can_grenade = true

func _on_laser_timer_timeout():
	can_laser = true
