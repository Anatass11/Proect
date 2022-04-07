extends Node2D



func _on_Back_pressed():
	GlobalBase.play1()
	get_tree().change_scene("res://Data/BaseMenu.tscn")


func _on_Dino_pressed():
	GlobalBase.play1()
	$Node/Dino.show()


func hide():
	$Node/Dino.hide()
