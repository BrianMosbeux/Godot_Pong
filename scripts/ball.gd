extends RigidBody2D

@onready var collision_shape_2d = $CollisionShape2D


# DISPLAY
var screen_size: Vector2
var start_pos: Vector2 = Vector2.ZERO
var radius: float
var color: Color = Color.WHITE
# PHYSICS
var direction: Vector2 = Vector2.ZERO
var speed: int = 500

func _draw():
	radius = collision_shape_2d.shape.radius
	draw_circle(collision_shape_2d.position, radius, color)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	start_pos.x = screen_size.x / 2
	start_pos.y = screen_size.y / 2
	position = start_pos
	direction = Vector2.RIGHT

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_direction()
	
	
func _integrate_forces(state):
	linear_velocity = direction * speed
	
	
func get_direction():
	var collision = move_and_collide(direction)
	if collision:
		direction = direction.bounce(collision.get_normal())
