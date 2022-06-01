extends Area2D

var damage = 50
var damaged = false
var show = true
var done = false
var death = false
var type
var skill = 0
var Egroup = "friend"
var rng = RandomNumberGenerator.new()
var target
var speed = 1000

func _ready():
	damage += 10 * (GlobalBase.chos - 6)
# Called when the node enters the scene tree for the first time.

func _process(delta):
	if get_overlapping_bodies() != []:
		for i in get_overlapping_bodies():
				if i in get_tree().get_nodes_in_group(Egroup) and not damaged:
					get_parent().hit()
					i.reducehp(damage)
					get_parent().stop = true
					damaged = true


func _on_Area2D_area_entered(area):
	if(area.name == "DamageArea") or (area.name == "Base"):
		var x = area.get_parent()
		if x in get_tree().get_nodes_in_group(Egroup) and not damaged:
			get_parent().hit()
			x.reducehp(damage)
			get_parent().stop = true
			damaged = true
