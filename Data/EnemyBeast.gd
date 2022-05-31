extends Node2D

func _ready():
	hide()

func _on_Back_pressed():
	GlobalBase.play1()
	get_tree().change_scene("res://Data/BaseMenu.tscn")

func hide():
	$Node/person.hide()
	$Node2/person.hide()
	$Node3/person.hide()
	$Node4/person.hide()
	$Node5/person.hide()
	$Node6/person.hide()
	$Node7/person.hide()
	$Node8/person.hide()
	$Node9/person.hide()
	$Node10/person.hide()
	$Node11/person.hide()
	$Node12/person.hide()
	$Node13/person.hide()

func _on_Neander_pressed():
	hide()
	GlobalBase.play1()
	$Node/person.show()


func _on_Button2_pressed():
	hide()
	GlobalBase.play1()
	$Node2/person.show()


func _on_Button3_pressed():
	hide()
	GlobalBase.play1()
	$Node3/person.show()


func _on_Button4_pressed():
	hide()
	GlobalBase.play1()
	$Node4/person.show()


func _on_Button5_pressed():
	hide()
	GlobalBase.play1()
	$Node5/person.show()


func _on_Button6_pressed():
	hide()
	GlobalBase.play1()
	$Node6/person.show()


func _on_Button7_pressed():
	hide()
	GlobalBase.play1()
	$Node7/person.show()


func _on_Button8_pressed():
	hide()
	GlobalBase.play1()
	$Node8/person.show()


func _on_Button9_pressed():
	hide()
	GlobalBase.play1()
	$Node9/person.show()

func _on_Button10_pressed():
	hide()
	GlobalBase.play1()
	$Node10/person.show()


func _on_Button11_pressed():
	hide()
	GlobalBase.play1()
	$Node11/person.show()


func _on_Button12_pressed():
	hide()
	GlobalBase.play1()
	$Node12/person.show()


func _on_Button13_pressed():
	hide()
	GlobalBase.play1()
	$Node13/person.show()
