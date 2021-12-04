extends Node2D

#onready var Warrior = preload("res://Characters/Heros/Warrior/Warrior.tscn")
onready var Hero = preload("res://Characters/Heros/Samurai/Samurai.tscn")
onready var Grunt = preload("res://Characters/Mobs/Grunt/Grunt.tscn")
onready var Archer = preload("res://Characters/Mobs/Archer/Archer.tscn")
onready var Zombie = preload("res://Characters/Mobs/Zombie/Zombie.tscn")
onready var Spider = preload("res://Characters/Mobs/Spider/Spider.tscn")
var wave_counter = 0
var spawn_interval = 1
var mob_list = []
func _ready():
#	var warrior = Warrior.instance()
#	add_child(warrior)
	var hero = Hero.instance()
	hero.set_name("Hero")
	add_child(hero)
#	var grunt = Grunt.instance()
	mob_list.append(Grunt)
#	add_child(grunt)
#	var archer = Archer.instance()
#	add_child(archer)
	mob_list.append(Archer)
#	archer.position = Vector2(100,150)
#	var zombie = Zombie.instance()
#	zombie.position = Vector2(400,200)
#	add_child(zombie)
	mob_list.append(Zombie)
#	var spider = Spider.instance()
#	spider.position = Vector2(300,300)
#	add_child(spider)
	mob_list.append(Spider)



func _on_Area2D_body_entered(body):
	if body.is_in_group("Hero"):
		body.speed_modifier = body.speed_modifier * 0.4	



func _on_Area2D_body_exited(body):
	if body.is_in_group("Hero"):
		body.speed_modifier = 2



func spawn_mob(Mob):
	var mob = Mob.instance()
	add_child(mob)
	$SpawnPath/PathFollow2D.set_offset(randi())
	mob.position = $SpawnPath/PathFollow2D.position
	

func _on_WaveTimer_timeout():
	print("stopped")
	$SpawnTimer.stop()
	wave_counter += 1
	var Pickup = preload("res://Items/Pickup.tscn")
	var pickup = Pickup.instance()
	add_child(pickup)
	pickup.position = Vector2(400,400)
	


func _on_SpawnTimer_timeout():
	print("spawn")
	randomize()
	var Mob = mob_list[rand_range(0,mob_list.size() -1)]
	spawn_mob(Mob)
	
	
func next_phase():
	$WaveTimer.start()
	$SpawnTimer.start()
