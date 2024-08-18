extends BaseLevel

# Signal receptor for when player enters the building gate
func _on_gate_player_entered_gate():
	var tween: Tween = create_tween()
	tween.tween_property($Player, "speed", 0 , 0.5)
	tween.tween_callback(func(): TransitionLayer.transition_to_scene("inside"))
