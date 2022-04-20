extends Node2D



var block = false
var cd2 = true
var friend = preload("res://Data/GoogUnit.tscn") 
var wait = false
var n = 1


func _ready():
	$Timer.start(40)
	pass # Replace with function body.

func _process(delta):
	if wait:
		if cd2 and not block:
			var f = friend.instance()
			if n == 1:
				f.position = $SpawnPos.position
				n = 2
			elif n == 2:
				f.position = $SpawnPos2.position
				n = 3
			else:
				f.position = $SpawnPos3.position
				n = 1
			add_child(f)
			cd2 = false
			$CD.start(10)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func pay(cost):
	get_parent().pay(cost)

func _on_CD_timeout():
	cd2 = true


func _on_Timer_timeout():
	wait = true


func _on_GoodCastle_hit():
	$Timer.stop()
	wait = true
