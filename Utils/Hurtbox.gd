extends Area2D

signal on_got_hit(attack_stats)

func got_hit(attack_stats):
	print(name, "triggered")
	emit_signal("on_got_hit",attack_stats)
