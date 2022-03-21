extends Node2D



func _on_Back_pressed():
	GlobalBase.play1()
	get_tree().change_scene("res://Data/BaseMenu.tscn")


func _on_Pick1_pressed():
	$"/root/GlobalBase".play1()
	$Node/TextureRect4.hide()
	$Node/Dino.show()
