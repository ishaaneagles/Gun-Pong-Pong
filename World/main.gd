extends Node2D
var score_1 = 0
var score_2 = 0
@onready var ScoreLabel1 = $CanvasLayer/Score1
@onready var ScoreLabel2 = $CanvasLayer/Score2
@export var PackedBall : PackedScene
func _ready():
	ScoreLabel1.add_theme_color_override("font_color", Color(0,0,1))
	ScoreLabel2.add_theme_color_override("font_color", Color(1,0,0))
	update_score()
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
	var ball = PackedBall.instantiate()
	call_deferred("add_child",ball)
