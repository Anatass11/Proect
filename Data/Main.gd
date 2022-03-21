extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	GlobalBase.play1()
	for i in get_tree().get_nodes_in_group("friend"):
		i.queue_free()
	for i in get_tree().get_nodes_in_group("enemy"):
		i.queue_free()
	get_tree().change_scene("res://Data/BaseMenu.tscn")
