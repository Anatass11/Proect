extends KinematicBody2D

export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.extends Area2D
var hp = 100
var damage = 25
var stop = false
var death = false

func _ready():
	add_to_group("friend")
	screen_size = get_viewport_rect().size
	$death.hide()
	$DamageArea.type = true
	$DamageArea.Egroup = "enemy"
	$DamageArea.damage = damage
	#hide()

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if stop || death:
		velocity.x = 0
	else:
		velocity.x += speed
	

	if velocity.length() > 0:
		$AnimatedSprite.play("walk")
	else:
		if death:
			$AnimatedSprite.stop()
		else:
			$AnimatedSprite.play("atack")
		
	move_and_slide(velocity)
	position.x = clamp(position.x, 28, screen_size.x - 28)
	position.y = clamp(position.y, 35, screen_size.y - 35)


func start():
	show()

func move():
	stop = false

func attack():
	stop = true
	#$AnimatedSprite.stop()

func reducehp(dm):
	hp -= dm;
	if hp == 0:
		$DamageArea.death = true
		death = true
		$AnimatedSprite.hide()
		$death.show()
		$death.play("death")
		#queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_death_animation_finished():
	queue_free()
