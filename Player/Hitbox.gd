extends Area2D

var ball = null

func _ready():
	randomize()

func _on_body_entered(body):
	ball = body
	ball.ballSpeed = -ball.ballSpeed * 1.1
	ball.ballAngle = randi_range(-95, 95)
