extends BaseLevel

const outside_level_scene: PackedScene = preload("res://scenes/levels/outside.tscn")

# Signal receptor for when player exits the building gate
func _on_exit_gate_area_body_entered(_body):
	var tween: Tween = create_tween()
	tween.tween_property($Player, "speed", 0 , 0.5)
	tween.tween_callback(self.transition_to_scene.bind(outside_level_scene))
	
