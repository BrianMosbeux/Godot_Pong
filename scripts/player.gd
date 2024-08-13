extends CharacterBody2D


@export var player_index: int = 0

#INPUT MAP
var up_action: String
var up_action_event: InputEventKey
var down_action: String
var down_action_event: InputEventKey
var arrows: Dictionary = {
	"key_right": KEY_RIGHT,
	"key_left":  KEY_LEFT,
	"key_up":    KEY_UP,
	"key_down":  KEY_DOWN,
	}
var wasd: Dictionary = {
	"key_right": KEY_D,
	"key_left":  KEY_A,
	"key_up":    KEY_W,
	"key_down":  KEY_S,
	}
var hjkl: Dictionary = {
	"key_right": KEY_L,
	"key_left":  KEY_H,
	"key_up":    KEY_K,
	"key_down":  KEY_J,
	}
var uiop: Dictionary = {
	"key_right": KEY_P,
	"key_left":  KEY_U,
	"key_up":    KEY_O,
	"key_down":  KEY_I,
	}
var keymaps: Dictionary = {
			0: wasd,
			1: arrows,
			2: hjkl,
			3: uiop,
			}
#PHYSICS
var direction: Vector2 = Vector2.ZERO
var speed: int = 500
#DISPLAYS
var screen_size: Vector2
var start_pos: Vector2


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	start_pos.x = clamp(screen_size.x * player_index, 32, screen_size.x - 32)
	start_pos.y = screen_size.y / 2
	position = start_pos
	create_player_action()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	player_move_input()
	velocity = direction * speed
	position += velocity * delta

func _unhandled_input(event):
	#print(event)
	pass
	
func create_player_action():
	up_action = "p{n}_up".format({"n": player_index})
	InputMap.add_action(up_action)
	# Creat a new InputEvent instance to assign to the InputMap.
	up_action_event = InputEventKey.new()
	up_action_event.keycode = keymaps[player_index]["key_up"]
	InputMap.action_add_event(up_action, up_action_event)
	down_action = "p{n}_down".format({"n": player_index})
	InputMap.add_action(down_action)
	# Creat a new InputEvent instance to assign to the InputMap.
	down_action_event = InputEventKey.new()
	down_action_event.keycode = keymaps[player_index]["key_down"]
	InputMap.action_add_event(down_action, down_action_event)	
	
func player_move_input():
	var up_action = "p{n}_up".format({"n": player_index})
	var down_action = "p{n}_down".format({"n": player_index})
	direction.y = Input.get_axis(up_action, down_action)
