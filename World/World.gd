extends Node2D

onready var Warrior = preload("res://Characters/Heros/Warrior/Warrior.tscn")
onready var Grunt = preload("res://Characters/Mobs/Grunt/Grunt.tscn")
onready var Archer = preload("res://Characters/Mobs/Archer/Archer.tscn")
onready var Zombie = preload("res://Characters/Mobs/Zombie/Zombie.tscn")
onready var Spider = preload("res://Characters/Mobs/Spider/Spider.tscn")


func _ready():
	var warrior = Warrior.instance()
	add_child(warrior)
	var grunt = Grunt.instance()
	add_child(grunt)
	var archer = Archer.instance()
	add_child(archer)
	archer.position = Vector2(100,150)
	var zombie = Zombie.instance()
	zombie.position = Vector2(400,200)
	add_child(zombie)
	var spider = Spider.instance()
	spider.position = Vector2(300,300)
	add_child(spider)



func _on_Area2D_body_entered(body):
	if body.is_in_group("Hero"):
		body.speed_modifier = body.speed_modifier * 0.4	
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	if body.is_in_group("Hero"):
		body.speed_modifier = 2
	pass # Replace with function body.
