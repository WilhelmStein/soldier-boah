extends CanvasLayer

@onready var laser_label: Label = $AmmoContainerH/LaserCounter/VBoxContainer/Label
@onready var grenade_label: Label = $AmmoContainerH/GrenadeCounter/VBoxContainer/Label
@onready var laser_icon: TextureRect = $AmmoContainerH/LaserCounter/VBoxContainer/TextureRect
@onready var grenade_icon: TextureRect = $AmmoContainerH/GrenadeCounter/VBoxContainer/MarginContainer/TextureRect
@onready var health_bar: TextureProgressBar = $MarginContainer/HealthBar

func _ready() -> void:
	Globals.connect("stat_change", update_stat_text)
	update_stat_text()

func update_laser_text() -> void:		
	laser_label.text = str(Globals.laser_amount)
	update_color(Globals.laser_amount, laser_label, laser_icon)

func update_grenade_text() -> void:
	grenade_label.text = str(Globals.grenade_amount)
	update_color(Globals.grenade_amount, grenade_label, grenade_icon)

func update_health_bar() -> void:
	health_bar.value = Globals.health

func update_color(amount: int, label: Label, icon: TextureRect) -> void:
		var chosen_color: Color = Constants.RED if amount <= 0 else Constants.GREEN
		label.modulate = chosen_color
		icon.modulate = chosen_color

func update_stat_text() -> void:
	update_grenade_text()
	update_laser_text()
	update_health_bar()
