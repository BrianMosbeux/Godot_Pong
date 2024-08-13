extends Node2D

@export var Ball: PackedScene


@onready var timer = $Timer
@onready var player_1 = $Player1
@onready var player_2 = $Player2
@onready var point_area = $PointArea
@onready var point_area_2 = $PointArea2


# Called when the node enters the scene tree for the first time.
func _ready():
	start_point()
	point_area.connect("point", start_point)
	point_area_2.connect("point", start_point)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start_point():
	print("timer started")
	timer.start()
	

func _on_timer_timeout():
	var ball_instance = Ball.instantiate()
	add_child(ball_instance)
	print(ball_instance)

