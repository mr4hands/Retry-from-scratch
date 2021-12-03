extends KinematicBody2D
class_name KinematicCharacter2D

var state_machine
var velocity = Vector2.ZERO
const base_speed = 100
const base_acceleration = 400
const base_friction = 1000
var speed_modifier =1
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")


#func _ready():
#	state_machine = $AnimationTree.get("paramapters/playback")

func _process(delta):
#		aim()
	pass
		
func _physics_process(delta):
	move(delta)

	
	
func get_direction(move_up="move_up",move_right="move_right",move_down="move_down",move_left="move_left"):
	return Vector2(
		int(Input.get_action_strength("move_right")) - int(Input.get_action_strength("move_left")),
		int(Input.get_action_strength("move_down")) - int(Input.get_action_strength("move_up"))
	)

func move(delta):
	var direction = Vector2.ZERO
	direction = get_direction()
	var speed = base_speed * speed_modifier
	if direction != Vector2.ZERO:
		animationTree.set("parameters/Idle Blend/blend_position", direction)
		animationTree.set("parameters/Walk Blend/blend_position", direction)
		animationTree.set("parameters/Attack Blend/blend_position", direction)
		animationState.travel("Walk Blend")
		velocity = velocity.move_toward(speed * direction, base_acceleration * delta)
#		if state_machine: 
#			state_machine.travel("Walk Side")
#			if velocity.x<0: 
#				$Sprite.scale.x = -1
#			else:
#				$Sprite.scale.x = 1
	else:
		animationState.travel("Idle Blend")
		velocity = velocity.move_toward(Vector2.ZERO, base_friction * delta)
#		if state_machine: state_machine.travel("Idle")
		
	velocity = move_and_slide(velocity)
	
func aim():
	var mouse_position = get_global_mouse_position()
	look_at(mouse_position)
	var angle = get_angle_to(mouse_position)
	rotate(angle)
	

	
