extends KinematicBody2D

export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.extends Area2D
var hp = 100
var damage = 25
var stop = false
var death = false
var atack = false
var stopall = false
var skill = 3

func _ready():
	add_to_group("enemy")
	screen_size = get_viewport_rect().size
	$death.hide()
	$DamageArea.type = true
	##$DamageArea.skill = skill
	$DamageArea.Egroup = "friend"
	$DamageArea.damage = damage
	#hide()

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if stop || death || stopall:
		velocity.x = 0
	else:
		velocity.x += speed
	

	if velocity.length() > 0:
		$walk.play("walk")
	elif !stopall:
		if death:
			$walk.stop()
		else:
			$walk.play("atack")
	else:
		$walk.stop()
			
		
	move_and_slide(velocity)
	position.x = clamp(position.x, 28, screen_size.x - 28)
	position.y = clamp(position.y, 35, screen_size.y - 35)


func start():
	show()

func move():
	stop = false

func attack():
	atack = true
	stop = true
	#$AnimatedSprite.stop()

func reducehp(dm):
	hp -= dm;
	if hp == 0:
		$DamageArea.death = true
		death = true
		$walk.hide()
		$death.show()
		$death.play("death")
		#queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_death_animation_finished():
	queue_free()


