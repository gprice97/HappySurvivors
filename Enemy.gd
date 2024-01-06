extends CharacterBody2D

var health = 3


@onready var player = get_node("/root/Game/Player")

func _ready(): #_ready() activates when the node loads into the scene
	%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300
	move_and_slide()


func take_damage():
	health -= 1
	%Slime.play_hurt()
	if health == 0:
		queue_free()
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn") #Loading in Death Animation when health hits 0
		var smoke = SMOKE_SCENE.instantiate() # instantiating the Death animation
		smoke.global_position = %Slime.global_position #Placing the Smoke onto the position of the slime instead of the origin
		get_parent().add_child(smoke) # adding this as a child of the "Game" Node instead of as a child of the "Enemy" Node
									  # that way the smoke can still appear after we queue_free() the enemy on death
