extends BaseLevel

const outside_level_scene: PackedScene = preload("res://scenes/levels/outside.tscn")

# Signal receptor for when player exits the building gate
func _on_exit_gate_body_entered(_body):
	var tween: Tween = create_tween()
	tween.tween_property($Player, "speed", 0 , 0.5)
	self.transition_to_scene(outside_level_scene)
