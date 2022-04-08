extends Node2D


func _ready():
	hideS();



func _on_Back_pressed():
	GlobalBase.play1()
	get_tree().change_scene("res://Data/Menu.tscn")
	

func hideS():
	$ChooseLevel/L1.hide()
	$ChooseLevel/L2.hide()
	$ChooseLevel/L3.hide()
	$ChooseLevel/L4.hide()
	$ChooseLevel/BackM.hide()

func _on_BackM_pressed():
	GlobalBase.play1()
	hideS()
	$BaseM.show()

func _on_L1_pressed():
	GlobalBase.play1()
	get_tree().change_scene("res://Data/Main.tscn")

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
