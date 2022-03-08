extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var C = "res://res/Sound_94111900 1634319689.mp3"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.





func _on_Button_pressed():
	GlobalBase.play1()
	get_tree().change_scene("res://Data/BaseMenu.tscn")
	


func _on_Button2_pressed():
	GlobalBase.play1()
	get_tree().quit()

