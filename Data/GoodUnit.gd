extends KinematicBody2D

export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.extends Area2D

func _ready():
	screen_size = get_viewport_rect().size
	#hide()

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move"):
		velocity.x += speed
	if Input.is_action_pressed("back"):
		velocity.x -= speed

	if velocity.length() > 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	move_and_slide(velocity)
	position.x = clamp(position.x, 28, screen_size.x - 28)
	position.y = clamp(position.y, 35, screen_size.y - 35)


func start():
	show()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
