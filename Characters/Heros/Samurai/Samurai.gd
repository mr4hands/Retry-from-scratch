extends KinematicCharacter2D


var attack_stats = {
	"damage" :10,
	"poison" : 0,
	"fire" : 0
}

var animation_speed

func _ready():
	speed_modifier = 2
	$Camera2D.set_zoom(Vector2(0.8,0.8))

func _process(delta):
	aim_crosshair()

#func _physics_process(delta):
#	var space_state = get_world_2d().direct_space_state
#
#	var result = space_state.intersect_ray(Vector2(0, 0), $Crosshair.position,[], collision_mask)
#
#	if result:
#		print("Hit at point: ", result["collider"])
func _play_attack_animation(attack):
	$Hitbox/CollisionShape2D.disabled = false
	yield(get_tree().create_timer(0.2),"timeout")
	print(attack)
	$Hitbox/CollisionShape2D.disabled = true
	
	
func aim_crosshair():
	var aim_to = direction.normalized() * 100
#	$Crosshair.position = aim_to
	var angle = get_angle_to(aim_to)
#	$Crosshair.look_at(aim_to *2)
	$AwarenessZone.look_at(get_global_mouse_position())


func _on_Hurtbox_on_got_hit(attack_stats):
	print(attack_stats)


func _on_AwarenessZone_body_entered(body):
	if body.is_in_group("Mob"):
		body.show_health(true)



func _on_AwarenessZone_body_exited(body):
	if body.is_in_group("Mob"):
		body.show_health(false)

