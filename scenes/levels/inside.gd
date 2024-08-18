extends BaseLevel

# Signal receptor for when player exits the building gate
func _on_exit_gate_area_body_entered(_body):
	var tween: Tween = create_tween()
	tween.tween_property($Player, "speed", 0 , 0.5)
	tween.tween_callback(func(): TransitionLayer.transition_to_scene("outside"))
