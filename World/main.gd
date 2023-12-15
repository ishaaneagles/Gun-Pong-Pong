extends Node2D
var score_1 = 0
var score_2 = 0
var round = 1
@onready var ScoreLabel1 = $CanvasLayer/Score1
@onready var ScoreLabel2 = $CanvasLayer/Score2
@onready var Ball = $Ball
@export var PackedBall : PackedScene
func _ready():
	update_score()
	if (randf() < 0.5):
		round = 0
		Ball.ballSpeed = -Ball.ballSpeed
func _on_goal_player_1_scored():
	score_1+=1
func _on_goal_player_2_scored():
	score_2+=1
func update_score():
	ScoreLabel1.text = "%d"%score_1
	ScoreLabel2.text = "%d"%score_2
func _physics_process(delta):
	update_score()


func _on_goal_reset_ball():
	round = round + 1
	var ball = PackedBall.instantiate()
	if (round % 2 == 0):
		ball.ballSpeed = -ball.ballSpeed
	call_deferred("add_child",ball)
