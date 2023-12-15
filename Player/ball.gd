extends CharacterBody2D

var ballSpeed = 400
var ballAngle = 0
var collision = false

func _process(delta):
	if collision == false:
		velocity.x = -ballSpeed
		velocity.y = ballAngle
	move_and_slide()
