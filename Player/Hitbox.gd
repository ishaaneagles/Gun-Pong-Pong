extends Area2D

var ball = null

func _ready():
	randomize()

func _on_body_entered(body):
	ball = body
	ball.ballSpeed = -ball.ballSpeed
	ball.ballAngle = randi_range(-95, 95)
	
	
