extends Node2D

 
var player_score = 0

func spawn_enemy():
	var new_enemy = preload("res://enemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_enemy.global_position = %PathFollow2D.global_position
	add_child(new_enemy) #Adds the Enemy to the Game Scene
	new_enemy.enemy_died.connect(raise_score)


func _on_timer_timeout():
	spawn_enemy()


func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true

func raise_score():
	player_score += 100
	%ScoreLabel.text = "Score: " + str(player_score)

func _on_resume_button_pressed():
	get_tree().paused = false
	%PauseMenu.visible = false
	

func _input(event : InputEvent):
	if(event.is_action_pressed("Menu")):
		get_tree().paused = true
		%PauseMenu.visible = true


