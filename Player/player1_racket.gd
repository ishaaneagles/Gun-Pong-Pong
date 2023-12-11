extends CharacterBody2D


const SPEED = 400.0

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Vector2.ZERO
	direction.y = Input.get_action_strength("racket_down")-Input.get_action_strength("racket_up")
	direction = direction.normalized()
	if direction:
		velocity = SPEED*direction
	else:
		velocity.y = lerp(SPEED, 0.0, 1)
		velocity.x = lerp(SPEED, 0.0, 1)

	move_and_slide()
