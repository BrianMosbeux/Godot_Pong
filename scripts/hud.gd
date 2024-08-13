extends CanvasLayer

@onready var score_1 = $MarginContainer/VBoxContainer/BottomContainer/Score1
@onready var score_2 = $MarginContainer/VBoxContainer/BottomContainer/Score2
@onready var timer_label = $MarginContainer/VBoxContainer/MiddleContainer/TimerLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_player_1_score(score):
	score_1.text = str(score)

func set_player_2_score(score):
	score_2.text = str(score)

func set_timer_label(time_left):
	timer_label = str(time_left)
