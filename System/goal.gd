extends Area2D

var ball = null
var ballSpeed = null

func _on_body_entered(body):
	ball = body
	ball.queue_free()
	
