extends KinematicBody2D

export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.extends Area2D
var hp = 100
var damage = 20
var cost = 25
var stop = false
var death = false
var atack = false
var stopall = false
var skill = 4
var clas = 1
var hitted = false
var ammo = preload("res://Data/Jinn_ammo.tscn")

func _ready():
	add_to_group("enemy")
	screen_size = get_viewport_rect().size
	$death.hide()
	$attack.hide()
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
		$walk.play()
	else:
		$walk.stop()
			
		
	movee(velocity)
	position.x = clamp(position.x, 28, screen_size.x - 28)
	position.y = clamp(position.y, 35, screen_size.y - 35)

func movee(velocity):
	move_and_slide(velocity)

func start():
	show()

func move():
	stop = false

func attack():
	atack = true
	stop = true
	$walk.stop()
	$walk.hide()
	if !death:
		$attack.show()
		$attack.play()
		#$attack.hide()
		#$walk.show()
	else:
		$attack.stop()
		$attack.hide()
	#$AnimatedSprite.stop()

func call_effect(type):
	if type == 2:
		var velocity1 = Vector2.ZERO # The player's movement vector.
		velocity1.x -= 250 * speed
		movee(velocity1)
	if type == 3:
		stopall = true
		$Effect.start(1)

func reducehp(dm):
	hp -= dm;
	if hp <= 0:
		$DamageArea.death = true
		death = true
		$attack.stop()
		$attack.hide()
		$walk.hide()
		$death.show()
		$death.play()
		get_parent().get_parent().pay(cost)
		#queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_death_animation_finished():
	queue_free()

func _on_Effect_timeout():
	stopall = false


func _on_attack_animation_finished():
	if !death:
		var x = ammo.instance()
		x.position = $shoot.position
		add_child(x)
		
		$attack.stop()
		$attack.hide()
		$DamageArea.attack()
		$walk.show()
