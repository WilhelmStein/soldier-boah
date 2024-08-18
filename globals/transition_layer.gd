extends CanvasLayer

# Variable holds the currently loaded scene as a reference
var current_scene

# Variable that holds ALL level scene paths
var LEVEL_SCENES: Dictionary = {
	"outside" : load("res://scenes/levels/outside.tscn"),
	"inside" : load("res://scenes/levels/inside.tscn")
}

# We force the TransitionLayer to spend as much as time as it wants until all SCENES are loaded
func _ready() -> void: await self.ready

# Utility function that implements the transition to a new scene with a proper transition animation
func transition_to_scene(levelname: String) -> void:
	if LEVEL_SCENES[levelname] == null:
		assert(false, "Levelname: %s does NOT exist!" % levelname)
		
	$AnimationPlayer.play("fade_to_black")
	await $AnimationPlayer.animation_finished
	
	# We make a switcheroo of scenes. First add the new scene to the root, then remove the old scene.
	var instance = LEVEL_SCENES[levelname].instantiate()
	get_tree().root.add_child(instance)
	get_tree().root.remove_child(current_scene)
	current_scene = instance
	
	$AnimationPlayer.play_backwards("fade_to_black")
