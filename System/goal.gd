extends Area2D

var ball = null
var ballSpeed = null
signal player_1_scored
signal player_2_scored
signal reset_ball
func _on_body_entered(body):
	if (body.is_in_group("Ball")):
		ball = body
		reset_ball.emit()
		var ball_velocity_x = ball.velocity.x
		if (ball_velocity_x < 0):
			player_2_scored.emit()
		else:
			player_1_scored.emit()
		ball.queue_free()
	
