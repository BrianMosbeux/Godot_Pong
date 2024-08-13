extends Node2D

@export var Ball: PackedScene


@onready var timer = $Timer
@onready var player_1 = $Player1
@onready var player_2 = $Player2
@onready var point_area_1 = $PointArea1
@onready var point_area_2 = $PointArea2
@onready var hud = $HUD


# Called when the node enters the scene tree for the first time.
func _ready():
	start_point()
	player_1.team.team = 0
	player_2.team.team = 1
	point_area_1.team.team = 1
	point_area_2.team.team = 0
	point_area_1.connect("point", update_score)
	point_area_2.connect("point", update_score)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hud.set_timer_label(timer.time_left)
	
func update_score(team):
	if team.team == player_1.team.team:
		player_1.team.score += 1
		hud.set_player_1_score(player_1.team.score)
	else: 
		player_2.team.score += 1
		hud.set_player_2_score(player_2.team.score)
	start_point()
	
func start_point():
	#hud.set_player_1_score()
	timer.start()
	
	

func _on_timer_timeout():
	var ball_instance = Ball.instantiate()
	add_child(ball_instance)
	

