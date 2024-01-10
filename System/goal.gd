extends Area2D

var ball = null
var ballSpeed = null
var gameOver = false
signal player_1_scored
signal player_2_scored
signal reset_ball
func _on_body_entered(body):
	if (body.is_in_group("Ball")):
		ScoreAudio.play()
		ball = body
		var ball_position_x = ball.position.x
		if (ball_position_x < 0):
			player_2_scored.emit()
		else:
			player_1_scored.emit()
		
		ball.queue_free()
		reset_ball.emit()
