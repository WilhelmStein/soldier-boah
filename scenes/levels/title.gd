extends CanvasLayer

const outside_level_scene: PackedScene = preload("res://scenes/levels/outside.tscn")

# On startup, the TransitionLayer is told what the loaded scene is
func _ready() -> void: TransitionLayer.current_scene = self

func _on_button_button_up():
	TransitionLayer.transition_to_scene("outside")
