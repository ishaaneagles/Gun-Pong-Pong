extends Node2D

var ballSpeed = 400

@onready var ball = $Ball

func _ready():
	game_start()

func _physics_process(delta):
	pass
	
func game_start():
	ball.apply_impulse(Vector2(-ballSpeed, 0), Vector2())
