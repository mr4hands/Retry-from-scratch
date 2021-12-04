extends KinematicMob2D

var 	velocity = Vector2.ZERO
var is_moving = false
var direction = Vector2.ZERO
var is_chasing = false
onready var obj = get_parent().get_node("Hero")


onready var screensize = get_viewport_rect().size

func _ready():
	speed = 80
	acceleration = 5000
	max_health = 10
	
	
func _physics_process(delta):
	if is_moving:
		if is_chasing:
			direction = (obj.global_position - global_position).normalized()
		move()

func move():
	randomize()

	velocity = velocity.move_toward(direction * speed, acceleration)
	velocity = move_and_slide(velocity)
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)


func _on_MoveTimer_timeout():
	if is_chasing:
		direction = (obj.global_position - global_position).normalized()
	else:
		direction = Vector2(rand_range(-PI / 2, PI/2),rand_range(-PI / 2, PI/2)).normalized()
	is_moving = !is_moving


func _on_AwarenessZone_body_entered(body):
	if body.is_in_group("Hero"):
		is_chasing = true
		
		
func _on_AwarenessZone_body_exited(body):
	if body.is_in_group("Hero"):
		is_chasing = false
