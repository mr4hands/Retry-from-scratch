extends KinematicCharacter2D

var animation_speed

func _ready():
	speed_modifier = 2


func _on_Hurtbox_on_got_hit(attack_stats):
	print(attack_stats)
	pass # Replace with function body.
