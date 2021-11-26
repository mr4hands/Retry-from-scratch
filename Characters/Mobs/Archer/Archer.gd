extends KinematicBody2D

onready var obj = get_parent().get_node("Warrior")
export (PackedScene) var Arrow
onready var shot_timer = $ShotTimer

var speed = 100
var acceleration = 300
var friction = 300

var velocity = Vector2.ZERO
var _delta
var is_chasing = true

var attack_stats = {
	"damage" : 5,
	"type" : "physical"
}


func _physics_process(delta):
	_delta = delta
	if is_chasing == true:
		chase()
	else:
		shoot()
		

	
func chase():
	var dir = (obj.global_position - global_position).normalized()
	velocity = velocity.move_toward(dir * speed, acceleration * _delta)
	velocity = move_and_slide(velocity)
	var angle = get_angle_to(obj.global_position)
	rotate(angle)
	
	
func shoot():
	velocity = velocity.move_toward(Vector2.ZERO, friction * _delta)
	velocity = move_and_slide(velocity)
	var angle = get_angle_to(obj.global_position)
	rotate(angle)

func fire():
	var arrow = Arrow.instance()
	
	arrow.transform = $Bow.global_transform
	get_parent().add_child(arrow)


func _on_AwarenessZone_body_entered(body):
	if body.is_in_group("Hero"):
		shot_timer.start()
		is_chasing = false


func _on_AwarenessZone_body_exited(body):
	if body.is_in_group("Hero"):
		shot_timer.stop()
		is_chasing = true



func _on_ShotTimer_timeout():
	fire()
