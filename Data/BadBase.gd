extends Node2D

var block = false
var cd2 = true
var cd3 = true
var cd4 = true
var wait = false
var n = 1
var units



func _ready():
	units = GlobalBase.set[GlobalBase.chos]
	$Timer.start(20)
	

func _process(delta):
	if wait:
		if cd2 and not block and units[0] != -1:
			var f = GlobalBase.enemys[units[0]].instance()
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
			$CD.start(GlobalBase.cd[units[0]])
		if cd3 and not block and units[1] != -1:
			var f = GlobalBase.enemys[units[1]].instance()
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
			cd3 = false
			$CD1.start(GlobalBase.cd[units[1]])
		if cd4 and not block and units[2] != -1:
			var f = GlobalBase.enemys[units[2]].instance()
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
			cd4 = false
			$CD2.start(GlobalBase.cd[units[2]])
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


func _on_CD1_timeout():
	cd3 = true


func _on_CD2_timeout():
	cd4 = true
