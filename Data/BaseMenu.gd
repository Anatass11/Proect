extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	hideS();

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


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
	$BaseM.hide()
	$ChooseLevel/L1.show()
	$ChooseLevel/BackM.show()
	

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
