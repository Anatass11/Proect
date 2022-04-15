extends KinematicBody2D

export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.extends Area2D
var hp = 100
var damage = 10
var stop = false
var attack = false
var stopall = false
var death = false
var skill = 3
var clas = 1

func _ready():
	add_to_group("friend")
	screen_size = get_viewport_rect().size
	$AnimatedSprite.playing = true
	$DamageArea.type = true
	$DamageArea.skill = skill
	$DamageArea.Egroup = "enemy"
	$DamageArea.damage = damage

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if stop:
		velocity.x = 0
	else:
		velocity.x -= speed
	
	if velocity.length() > 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	move_and_slide(velocity)
	position.x = clamp(position.x, 28, screen_size.x - 28)
	position.y = clamp(position.y, 35, screen_size.y - 35)

func move():
	stop = false

func attack():
	stop = true
	#$AnimatedSprite.stop()
	#$AnimatedSprite.play("atack")

func call_effect(type):
	if type == 3:
		stopall = true
		$Effect.start(1)

func reducehp(dm):
	hp -= dm;
	if hp == 0:
		death = true
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_AnimatedSprite_animation_finished():
	pass


func _on_Effect_timeout():
	stopall = false
