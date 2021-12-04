extends KinematicMob2D


var friction = 10

onready var obj = get_parent().get_node("Hero")
var _delta
var velocity = Vector2()

func _ready():
	speed = 30
	acceleration = 10
	max_health = 30
	current_health = max_health
	attack_stats = {
		"damage" : 5,
		"type" : "physical"
	}
	
	
func _physics_process(delta):
	_delta = delta
	chase()


func chase():
	var direction = (obj.global_position - global_position).normalized()
	velocity = direction * speed
	velocity = move_and_slide(velocity)
#	var angle = get_angle_to(obj.global_position)
#	rotate(angle)
	look_at(obj.global_position)

