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

@onready var bullet_chamber = $BulletChamber
const SPEED = 400.0
var isGameOver = false
var bullet = preload("res://Gun/bullet.tscn")

var bullet_speed = 600
var chargeCount = 0
func shoot():
	if (chargeCount > 0):
		var bullet_instance = bullet.instantiate()
		bullet_instance.position = bullet_chamber.global_position
		bullet_instance.apply_impulse(Vector2(-bullet_speed, 0),Vector2())
		get_tree().get_root().add_child(bullet_instance)
func _physics_process(delta):
	var direction = Vector2.ZERO
	
	if (!isGameOver):
		direction.y = Input.get_action_strength("racket_down2")-Input.get_action_strength("racket_up2")
	
	if (Input.is_action_just_pressed("shoot2")):
		shoot()
		chargeCount = max(chargeCount - 1, 0)
	if direction:
		velocity = SPEED * direction
	else:
		velocity.y = lerp(SPEED, 0.0, 1)
	move_and_slide()

func _on_hurtboxtop_body_entered(body):
	var hurtt = $Hurtboxtop/Topwall
	wallt.queue_free()
	skint.queue_free()
	hitt.queue_free()
	hurtt.queue_free()

func _on_hurtboxmid_body_entered(body):
	var hurtm = $Hurtboxmid/Midwall
	wallm.queue_free()
	skinm.queue_free()
	hitm.queue_free()
	hurtm.queue_free()

func _on_hurtboxbot_body_entered(body):
	var hurtb = $Hurtboxbot/Bottomwall
	wallb.queue_free()
	skinb.queue_free()
	hitb.queue_free()
	hurtb.queue_free()


func _on_main_game_ended():
	isGameOver = true


func _on_goal_player_2_scored():
	chargeCount += 1
