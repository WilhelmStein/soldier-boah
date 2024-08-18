extends CanvasLayer

const outside_level_scene: PackedScene = preload("res://scenes/levels/outside.tscn")


func _on_button_button_up():
	get_tree().change_scene_to_packed(outside_level_scene)
