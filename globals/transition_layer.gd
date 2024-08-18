extends CanvasLayer

# Utility function that implements the transition to a new scene with a proper transition animation
func transition_to_scene(scene: PackedScene) -> void:
	$AnimationPlayer.play("fade_to_black")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_packed.bind(scene).call_deferred()
	$AnimationPlayer.play_backwards("fade_to_black")
