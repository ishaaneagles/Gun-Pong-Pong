extends CharacterBody2D

var ballSpeed = 200

var collision = false

func _ready():
	pass
	
func _process(delta):
	
	if collision == false:
		velocity.x = -ballSpeed
		
	move_and_slide()
