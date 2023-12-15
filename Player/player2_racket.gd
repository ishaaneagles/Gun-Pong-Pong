extends CharacterBody2D

@onready var wallt = $Topwall
@onready var wallm = $Midwall
@onready var wallb = $Bottomwall

@onready var skint = $Top
@onready var skinm = $Middle
@onready var skinb = $Bottom

@onready var hitt = $Hitbox/Top
@onready var hitm = $Hitbox/Middle
@onready var hitb = $Hitbox/Bottom

const SPEED = 400.0

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	direction.y = Input.get_action_strength("racket_down2")-Input.get_action_strength("racket_up2")
	
	if direction:
		velocity = SPEED * direction
	else:
		velocity.y = lerp(SPEED, 0.0, 1)
	move_and_slide()

func _on_hurtboxtop_body_entered(body):
	var hurtt = $Hurtboxtop/Topwall
	wallt.disabled = true
	skint.visible = false
	hitt.disabled = true
	hurtt.disabled = true

func _on_hurtboxmid_body_entered(body):
	var hurtm = $Hurtboxmid/Midwall
	wallm.disabled = true
	skinm.visible = false
	hitm.disabled = true
	hurtm.disabled = true

func _on_hurtboxbot_body_entered(body):
	var hurtb = $Hurtboxbot/Bottomwall
	wallb.disabled = true
	skinb.visible = false
	hitb.disabled = true
	hurtb.disabled = true