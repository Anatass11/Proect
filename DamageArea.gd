extends Area2D

var damage = 0
var damaged = false
var show = true
var done = true
var death = false
var type
var Egroup
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.


func _process(delta):
	if not death and not damaged and get_overlapping_bodies() != []:
		for i in get_overlapping_bodies(): 
			if done:
				if i in get_tree().get_nodes_in_group(Egroup):
					if show:
						get_parent().attack()
						show = false
					i.reducehp(damage)
					if type:
						done = false
		damaged = true;
		done = true
		$Timer.start(0.5)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	damaged = false
	show = true
	get_parent().move()
