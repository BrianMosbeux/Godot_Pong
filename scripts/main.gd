extends Node

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
	var time_left = timer.time_left
	var ceil_time_left = ceil(time_left)
	hud.set_timer_label(ceil_time_left)
	
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
	hud.timer_label.show()
	
	

func _on_timer_timeout():
	var ball_instance = Ball.instantiate()
	hud.timer_label.hide()
	add_child(ball_instance)
	

