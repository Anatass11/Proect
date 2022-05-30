extends Node2D


func _ready():
	#hideS();
	print(GlobalBase.levels)
	for i in range(0, GlobalBase.levels.size()):
		var a = GlobalBase.levels[i]
		if a == 1: turn_on(i)

func _process(delta):
	$BaseM/Money.text = "$ " + String(GlobalBase.val)

func _on_Back_pressed():
	GlobalBase.play1()
	get_tree().change_scene("res://Data/Menu.tscn")
	

func hideS():
	$ChooseLevel/L1.hide()
	$ChooseLevel/L2.hide()
	$ChooseLevel/L3.hide()
	$ChooseLevel/L4.hide()
	$ChooseLevel/BackM.hide()
	$BaseM/L1.disabled = true
	$BaseM/L2.disabled = true
	$BaseM/L3.disabled = true
	#$BaseM/L4.disabled = true
	#$BaseM/L5.disabled = true

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
	#if i == 0: $BaseM/L1.disabled = false
	#elif i == 1: $BaseM/L2.disabled = false
	#elif i == 2: $BaseM/L3.disabled = false
	#elif i == 4: $BaseM/L4.disabled = false
	#elif i == 5: $BaseM/L5.disabled = false

func _on_BackM_pressed():
	GlobalBase.play1()
	hideS()
	$BaseM.show()

func _on_L1_pressed():
	GlobalBase.play1()
	GlobalBase.Music(2)
	get_tree().change_scene("res://Data/Level.tscn")

func _on_L2_pressed():
	GlobalBase.play1()
	$BaseM.hide()
	$ChooseLevel/L2.show()
	$ChooseLevel/BackM.show()


func _on_L3_pressed():
	GlobalBase.play1()
	$BaseM.hide()
	$ChooseLevel/L3.show()
	$ChooseLevel/BackM.show()


func _on_BASE_pressed():
	GlobalBase.play1()
	get_tree().change_scene("res://Data/MyBase.tscn")


func _on_BEAST_pressed():
	GlobalBase.play1()
	get_tree().change_scene("res://Data/EnemyBeast.tscn")
