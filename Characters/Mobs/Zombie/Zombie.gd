extends KinematicBody2D

var speed = 50
var acceleration = 10
var friction = 10

onready var obj = get_parent().get_node("Warrior")
var _delta
var velocity = Vector2()

var attack_stats = {
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
	var angle = get_angle_to(obj.global_position)
	rotate(angle)

