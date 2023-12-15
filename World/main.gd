extends Node2D
const WINNING_SCORE = 10;
var score_1 = 0
var score_2 = 0
var round = 1
var isGameOver = false
@onready var ScoreLabel1 = $CanvasLayer/Score1
@onready var ScoreLabel2 = $CanvasLayer/Score2
@onready var Ball = $Ball
@onready var _viewport = $CanvasLayer
@onready var music_player = $AudioStreamPlayer
@export var PackedBall : PackedScene
var gameOver = preload("res://Screens/gameOver.tscn")
signal gameEnded;
func _ready():
	update_score()
	if (randf() < 0.5):
		round = 0
		Ball.ballSpeed = -Ball.ballSpeed
func _on_goal_player_1_scored():
	score_1+=1
	if (score_1 >= WINNING_SCORE):
		game_over()
func _on_goal_player_2_scored():
	score_2+=1
	if (score_2 >= WINNING_SCORE):
		game_over()
func update_score():
	ScoreLabel1.text = "%d"%score_1
	ScoreLabel2.text = "%d"%score_2
func _physics_process(delta):
	update_score()
func _on_goal_reset_ball():
	if (!isGameOver):
		round = round + 1
		var ball = PackedBall.instantiate()
		if (round % 2 == 0):
			ball.ballSpeed = -ball.ballSpeed
		call_deferred("add_child",ball)
func game_over():
	isGameOver = true;
	music_player.stop()
	gameEnded.emit();
	var game_over_instance = gameOver.instantiate()
	_viewport.add_child(game_over_instance)
