class_name Item extends Area2D

const item_type_to_weight: Dictionary = {
	Enums.ITEM_TYPE.LASER_AMMO: 1,
	Enums.ITEM_TYPE.GRENADE_AMMO: 1,
	Enums.ITEM_TYPE.HEALTH_KIT: 1,
}

const MAX_LASER_AMMO_PER_ITEM: int = 15
const MAX_GRENADE_AMMO_PER_ITEM: int = 3
const MAX_HEALTH_PER_ITEM: int = 30

const rotation_speed: int = 3

var type: Enums.ITEM_TYPE
var value: int

func _ready() -> void:
	type = Utils.get_random_enum_weighted(Enums.ITEM_TYPE, item_type_to_weight) as Enums.ITEM_TYPE
	update_properties()

func _process(delta):
	rotation = rotation_speed * delta

func update_properties():
	var chosen_color: Color
	var chosen_value: int
	
	if type == Enums.ITEM_TYPE.LASER_AMMO:
		chosen_color = Constants.BLUE
		chosen_value = randi() % MAX_LASER_AMMO_PER_ITEM
	elif type == Enums.ITEM_TYPE.GRENADE_AMMO:
		chosen_color = Constants.RED
		chosen_value = randi() % MAX_GRENADE_AMMO_PER_ITEM
	elif type == Enums.ITEM_TYPE.HEALTH_KIT:
		chosen_color = Constants.GREEN
		chosen_value = randi() % MAX_HEALTH_PER_ITEM
	else:
		assert(false, "Unknown item type: %s" % type)
	
	$Sprite2D.modulate = chosen_color
	value = chosen_value

func _on_body_entered(body: Node2D) -> void:
	if not body is Player:
		return
	
	var player: Player = body as Player
	
	# Add item to player
	player.take_item(self)
	
	# Delete item
	queue_free()
