extends Node2D

func _ready():
	hide()

func _on_Back_pressed():
	GlobalBase.play1()
	get_tree().change_scene("res://Data/BaseMenu.tscn")

func hide():
	$Node/Neandertal.hide()

func _on_Neander_pressed():
	GlobalBase.play1()
	$Node/Neandertal.show()
