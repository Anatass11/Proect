extends Area2D

var damage = 100
var damaged = false
var show = true
var done = false
var death = false
var type
var skill = 0
var Egroup = "enemy"
var rng = RandomNumberGenerator.new()
var target
var speed = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("default")
	$Timer.start(3)

func _process(delta):
	if get_overlapping_bodies() != []:
		for i in get_overlapping_bodies():
				if i in get_tree().get_nodes_in_group(Egroup) and not i.hitted and i.clas == 1:
					i.reducehp(damage)
					i.hitted = true


func _on_Timer_timeout():
	for i in get_tree().get_nodes_in_group("enemy"):
		if i.clas == 1:
			i.hitted = false
	get_parent().queue_free()



func _on_AbilityArea_area_entered(area):
	if(area.name == "DamageArea"):
		var x = area.get_parent()
		if x in get_tree().get_nodes_in_group(Egroup) and not x.hitted and x.clas == 1:
						x.reducehp(damage)
						x.hitted = true
