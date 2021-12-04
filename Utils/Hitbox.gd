extends Area2D

var trigger

func _on_Hitbox_area_entered(area):
	trigger = area
	if trigger.is_in_group("Hurtbox") and (trigger.get_groups() != owner.get_groups()):
		trigger.got_hit(owner.attack_stats)
	pass # Replace with function body.
