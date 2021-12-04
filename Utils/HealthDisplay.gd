extends Node2D
class_name HealthDisplay


var static_position
onready var healthbar = $HealthBar

# Called when the node enters the scene tree for the first time.
func _ready():

	hide()
	if get_parent() and get_parent().get("max_health"):
		healthbar.max_value = get_parent().max_health
		
func _process(delta):
	global_rotation = 0
	global_position = owner.position + Vector2(0,-15)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func update_healthbar(value):
	healthbar.value = value
