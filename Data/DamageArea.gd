extends Area2D

var damage = 0
var damaged = false
var show = true
var done = false
var death = false
var type
var skill = 0
var Egroup
var rng = RandomNumberGenerator.new()
var target
	

# Called when the node enters the scene tree for the first time.


func _process(delta):
	if not death and not damaged and get_overlapping_bodies() != [] and not get_parent().stopall:
		if type:
			for i in get_overlapping_bodies():
				if i in get_tree().get_nodes_in_group(Egroup):
					if show:
						get_parent().attack()
						show = false
					i.reducehp(damage)
					if i.clas != 0 and !i.death and !get_parent().death:
						if(skill == 1):
							pass
						if(skill == 2):
							rng.randomize()
							var num = rng.randi_range(0, 100)
							if(num <= 80):
								i.call_effect(2)
						if(skill == 3):
							rng.randomize()
							var num = rng.randi_range(0, 100)
							if(num <= 30):
								i.call_effect(3)
					damaged = true
					$Timer.start(0.5)
		else:
			if show:
				get_parent().attack()
				show = false
			for i in get_overlapping_bodies():
				i.reducehp(damage)
			damaged = true;
			$Timer.start(0.5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func slow():
	pass
	
func push():
	pass


func _on_Timer_timeout():
	damaged = false
	show = true
	get_parent().move()

