extends KinematicBody2D

export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.extends Area2D
var hp = 100
var damage = 20
var stop = false
var attack = false
var stopall = false
var death = false
var skill = 2
var clas = 1


func _ready():
	add_to_group("friend")
	screen_size = get_viewport_rect().size
	$attack.hide()
	$death.hide()
	$walk.playing = true
	$DamageArea.type = true
	$DamageArea.skill = skill
	$DamageArea.Egroup = "enemy"
	$DamageArea.damage = damage

func _process(delta):
	var velocity = Vector2.ZERO
	if stop || death || stopall:
		velocity.x = 0
	else:
		velocity.x -= speed
	
	if velocity.length() > 0:
		$walk.play()
	else:
		$walk.stop()
			
		
	move_and_slide(velocity)
	position.x = clamp(position.x, 28, screen_size.x - 28)
	position.y = clamp(position.y, 35, screen_size.y - 35)

func move():
	stop = false

func attack():
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
	#$AnimatedSprite.play("atack")

func call_effect(type):
	if type == 2:
		var velocity1 = Vector2.ZERO
		velocity1.x += 2 * speed
		move_and_slide(velocity1)
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
		

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_AnimatedSprite_animation_finished():
	pass


func _on_Effect_timeout():
	stopall = false


func _on_attack_animation_finished():
	if !death:
		$attack.stop()
		$attack.hide()
		$DamageArea.attack()
		$walk.show()


func _on_death_animation_finished():
	queue_free()


func _on_Timer_timeout():
	pass # Replace with function body.
