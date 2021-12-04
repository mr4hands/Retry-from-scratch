extends Area2D

var modifier = {"speed":2.0}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _enter_tree():
	$Sprite.frame = rand_range(0, 71)



func _on_Pickup_body_entered(body):
	if body.is_in_group("Hero"):
		body.base_speed = body.base_speed * modifier["speed"]
		get_parent().next_phase()
		queue_free()
	pass # Replace with function body.
