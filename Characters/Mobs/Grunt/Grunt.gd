extends KinematicMob2D

onready var obj = get_parent().get_node("Hero")

var velocity = Vector2.ZERO

func _physics_process(delta):
	chase(delta)
	
	
func chase(delta):
	var dir = (obj.global_position - global_position).normalized()
	velocity = velocity.move_toward(dir * speed, acceleration * delta)
	velocity = move_and_slide(velocity)
	var angle = get_angle_to(obj.global_position)
	rotate(angle)
	
	
