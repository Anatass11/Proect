extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalBase.levels = [1, 0, 0, 0, 0, 0]
	GlobalBase.val = 0
	GlobalBase.Music(1)
	pass # Replace with function body.





func _on_Button_pressed():
	GlobalBase.save_game()
	GlobalBase.play1()
	get_tree().change_scene("res://Data/BaseMenu.tscn")
	


func _on_Button2_pressed():
	GlobalBase.play1()
	get_tree().quit()



func _on_Start2_pressed():
	GlobalBase.load_game()
	GlobalBase.play1()
	get_tree().change_scene("res://Data/BaseMenu.tscn")
