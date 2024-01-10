extends CharacterBody2D
var ballSpeed = 400
var ballAngle = 0
var collision = false
var isGameOver = false

func _ready():
	var main = get_parent()
	main.connect("gameEnded", _on_main_game_ended);

func _process(delta):
	if isGameOver == false:
		if collision == false:
			velocity.x = -ballSpeed
			velocity.y = ballAngle
		move_and_slide()

func _on_main_game_ended():
	isGameOver = true
