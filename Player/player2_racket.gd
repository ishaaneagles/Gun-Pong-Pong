extends CharacterBody2D


const SPEED = 400.0

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	direction.y = Input.get_action_strength("racket_down2")-Input.get_action_strength("racket_up2")
	
	if direction:
		velocity = SPEED * direction
	else:
		velocity.y = lerp(SPEED, 0.0, 1)
	move_and_slide()
