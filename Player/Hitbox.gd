extends Area2D

var ball = null

func _ready():
	randomize()

func _on_body_entered(body):
	if (body.is_in_group("Ball")):
		BallSound.play()
		ball = body
		ball.ballSpeed = -ball.ballSpeed
		ball.ballAngle = randi_range(-95, 95)
