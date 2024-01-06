extends CharacterBody2D #Adds code to all the code of CharacterBody2D, we extending that class to here

#Need to define Physics Process function
#Godot calls this whenever the game updates physics
func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down") #This creates a direction vector of length 1 for postive/negative/x/y axis
	velocity = direction * 600 #Multiply the magnitude of this vector so the character isn't too slow
	#Note, velocity  is a keyword in Godot and is used for the move_and_slide() function
	move_and_slide() #Moves my character based on my velocity
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation() #   $HappyBoo is equivalent to get_node("HappyBoo"), the $ is just a shortcut
	else:								#	%HappyBoo works if you right click the node and hit Access as Unique name, kinda seems like static variables?
		%HappyBoo.play_idle_animation()
