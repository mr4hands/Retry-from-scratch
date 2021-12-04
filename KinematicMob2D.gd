extends KinematicBody2D
class_name KinematicMob2D

export var speed = 50
export var acceleration = 100
export var max_health = 100
var current_health = 0

var attack_stats = {
	"damage" :10,
	"poison" : 0,
	"fire" : 0
}

onready var health_display = $HealthDisplay

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
	
func got_hit(damage):
	current_health -= damage
	health_display.update_healthbar(current_health)
	if current_health <= 0:
		queue_free()
	
	
func _ready():
	current_health = max_health
	
	
	pass # Replace with function body.

	
func show_health(show):
	if show:
		health_display.show()
	else:
		health_display.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Hurtbox_on_got_hit(attack_stats):
	got_hit(attack_stats["damage"])

