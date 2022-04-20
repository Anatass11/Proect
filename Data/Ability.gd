extends KinematicBody2D

var speed = 250
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	velocity.x -= speed
	move_and_slide(velocity)
	position.x = clamp(position.x, 28, screen_size.x - 28)
	position.y = clamp(position.y, 35, screen_size.y - 35)
