extends Area2D

var ball = null

func _ready():
	pass;

func _on_body_entered(body):
	print('Test')
	print(body.name);
	if (body.is_in_group("Ball")):
		ball = body
		ball.ballAngle *= -1
		#ball.ballAngle = randi_range(-95, 95)
