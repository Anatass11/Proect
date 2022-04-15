extends Node2D

func _ready():
	pass # Replace with function body.

#

func _on_Button_pressed():
	GlobalBase.play1()
	for i in get_tree().get_nodes_in_group("friend"):
		i.queue_free()
	for i in get_tree().get_nodes_in_group("enemy"):
		i.queue_free()
	get_tree().change_scene("res://Data/BaseMenu.tscn")



func _on_GoodCastle_death_good():
	$Result.text = "You Win!"
	$Bad.block = true
	$Good.block = true


func _on_BadCastle_death_bad():
	$Result.text = "You Lose!"
	$Bad.block = true
	$Good.block = true
