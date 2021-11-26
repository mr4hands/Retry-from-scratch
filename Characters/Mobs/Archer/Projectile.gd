extends Area2D

var speed = 750
var attack_stats = {
	"damage" : 5,
	"type" : "physical"
}
func _physics_process(delta):
	position += transform.x * speed * delta


func _on_Projectile_area_entered(area):
	if area.is_in_group("Hurtbox"):
		area.got_hit(attack_stats)
