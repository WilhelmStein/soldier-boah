extends BaseLevel

const inside_level_scene: PackedScene = preload("res://scenes/levels/inside.tscn")

# Signal receptor for when player enters the building gate
func _on_gate_player_entered_gate():
	var tween: Tween = create_tween()
	tween.tween_property($Player, "speed", 0 , 0.5)
	tween.tween_callback(TransitionLayer.transition_to_scene.bind(inside_level_scene))
