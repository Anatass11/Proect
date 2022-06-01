extends Node2D


func _ready():
	hideS();
	#print(GlobalBase.levels)
	for i in range(0, GlobalBase.levels.size()):
		var a = GlobalBase.levels[i]
		if a == 1: turn_on(i)

func _process(delta):
	$BaseM/Money.text = "$ " + String(GlobalBase.val)

func _on_Back_pressed():
	GlobalBase.play1()
	get_tree().change_scene("res://Data/Menu.tscn")
	

func hideS():
	$BaseM/L1.disabled = true
	$BaseM/L2.disabled = true
	$BaseM/L3.disabled = true
	$BaseM/L4.disabled = true
	$BaseM/L5.disabled = true
	$BaseM/L6.disabled = true
	$BaseM/L7.disabled = true
	$BaseM/L8.disabled = true
	$BaseM/L9.disabled = true
	$BaseM/L10.disabled = true
	$BaseM/L11.disabled = true
	$BaseM/L12.disabled = true
	$BaseM/L13.disabled = true
	$BaseM/L14.disabled = true
	$BaseM/L15.disabled = true
	$BaseM/L16.disabled = true

func turn_on(var i):
	match i:
		0:
			$BaseM/L1.disabled = false
			return
		1:
			$BaseM/L2.disabled = false
			return
		2:
			$BaseM/L3.disabled = false
			return
		3:
			$BaseM/L4.disabled = false
			return
		4:
			$BaseM/L5.disabled = false
			return
		5:
			$BaseM/L6.disabled = false
			return
		6:
			$BaseM/L7.disabled = false
			return
		7:
			$BaseM/L8.disabled = false
			return
		8:
			$BaseM/L9.disabled = false
			return
		9:
			$BaseM/L10.disabled = false
			return
		10:
			$BaseM/L11.disabled = false
			return
		11:
			$BaseM/L12.disabled = false
			return
		12:
			$BaseM/L13.disabled = false
			return
		13:
			$BaseM/L14.disabled = false
			return
		14:
			$BaseM/L15.disabled = false
			return
		15:
			$BaseM/L16.disabled = false
			return
			
func _on_BackM_pressed():
	GlobalBase.play1()
	hideS()
	$BaseM.show()

func go():
	GlobalBase.play1()
	GlobalBase.Music(2)
	get_tree().change_scene("res://Data/Level.tscn")

func _on_L1_pressed():
	GlobalBase.chos = 0
	go()

func _on_L2_pressed():
	GlobalBase.chos = 1
	go()


func _on_L3_pressed():
	GlobalBase.chos = 2
	go()


func _on_BASE_pressed():
	GlobalBase.play1()
	get_tree().change_scene("res://Data/MyBase.tscn")


func _on_BEAST_pressed():
	GlobalBase.play1()
	get_tree().change_scene("res://Data/EnemyBeast.tscn")


func _on_L4_pressed():
	GlobalBase.chos = 3
	go()

func _on_L5_pressed():
	GlobalBase.chos = 4
	go()

func _on_L6_pressed():
	GlobalBase.chos = 5
	go()

func _on_L7_pressed():
	GlobalBase.chos = 6
	go()

func _on_L8_pressed():
	GlobalBase.chos = 7
	go()

func _on_L9_pressed():
	GlobalBase.chos = 8
	go()

func _on_L10_pressed():
	GlobalBase.chos = 9
	go()

func _on_L11_pressed():
	GlobalBase.chos = 10
	go()

func _on_L12_pressed():
	GlobalBase.chos = 11
	go()

func _on_L13_pressed():
	GlobalBase.chos = 12
	go()

func _on_L14_pressed():
	GlobalBase.chos = 13
	go()

func _on_L15_pressed():
	GlobalBase.chos = 14
	go()

func _on_L16_pressed():
	GlobalBase.chos = 15
	go()
