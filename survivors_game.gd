extends Node2D

func spawn_enemy():
	var new_enemy = preload("res://enemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_enemy.global_position = %PathFollow2D.global_position
	add_child(new_enemy) #Adds the Enemy to the Game Scene




func _on_timer_timeout():
	spawn_enemy()
