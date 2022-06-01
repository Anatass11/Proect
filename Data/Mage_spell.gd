extends KinematicBody2D

var speed = 250
var screen_size
var stop = false

func _ready():
	$attack.damaged = false
	$fly.play()
	$hit.hide()
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if !stop:
		velocity.x -= speed
	move_and_slide(velocity)
	#position.x = clamp(position.x, 28, screen_size.x - 28)
	#position.y = clamp(position.y, 35, screen_size.y - 35)


func _on_hit_animation_finished():
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func hit():
	$fly.stop()
	$fly.hide()
	$hit.show()
	$hit.play()
