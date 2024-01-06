extends Area2D

var travelled_distance = 0

func _physics_process(delta):
	const SPEED = 1000
	const RANGE = 1200
	
	var direction = Vector2.RIGHT.rotated(rotation) # This line will generate a direction vector based on the current rotation of the Bullet
													# That way the Bullet will fly "straight"
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	
	if travelled_distance > RANGE:
		queue_free()   #This destroys the bullet


func _on_body_entered(body):
	queue_free() #destroy bullet on entering another body
	if body.has_method("take_damage"):
		body.take_damage()
