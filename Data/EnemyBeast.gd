extends Node2D

func _ready():
	hide()
	show()
			

func _on_Back_pressed():
	GlobalBase.play1()
	get_tree().change_scene("res://Data/BaseMenu.tscn")

func show():
	for i in range(0, 16):
		if GlobalBase.levels[i]:
			if i == 0:
				$GridContainer/Button.disabled = false
			elif i == 2:
				$GridContainer/Button5.disabled = false
			elif i == 4:
				$GridContainer/Button7.disabled = false
			elif i == 6:
				$GridContainer/Button8.disabled = false
			elif i == 8:
				$GridContainer/Button9.disabled = false
			elif i == 10:
				$GridContainer/Button10.disabled = false
			elif i == 12:
				$GridContainer/Button11.disabled = false
			elif i == 14:
				$GridContainer/Button13.disabled = false
	for i in range(0, 4):
		if GlobalBase.unlock[i]:
			if i == 0:
				$GridContainer2/Button3.disabled = false
			elif i == 1:
				$GridContainer2/Button4.disabled = false
			elif i == 2:
				$GridContainer2/Button6.disabled = false
			elif i == 3:
				$GridContainer2/Button12.disabled = false

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
	$GridContainer/Button.disabled = true
	$GridContainer/Button5.disabled = true
	$GridContainer/Button7.disabled = true
	$GridContainer/Button8.disabled = true
	$GridContainer/Button9.disabled = true
	$GridContainer/Button10.disabled = true
	$GridContainer/Button11.disabled = true
	$GridContainer/Button13.disabled = true
	$GridContainer2/Button3.disabled = true
	$GridContainer2/Button4.disabled = true
	$GridContainer2/Button6.disabled = true
	$GridContainer2/Button12.disabled = true

func _on_Neander_pressed():
	hide()
	show()
	GlobalBase.play1()
	$Node/person.show()


func _on_Button2_pressed():
	hide()
	show()
	GlobalBase.play1()
	$Node2/person.show()


func _on_Button3_pressed():
	hide()
	show()
	GlobalBase.play1()
	$Node12/person.show()


func _on_Button4_pressed():
	hide()
	show()
	GlobalBase.play1()
	$Node3/person.show()


func _on_Button5_pressed():
	hide()
	show()
	GlobalBase.play1()
	$Node13/person.show()


func _on_Button6_pressed():
	hide()
	show()
	GlobalBase.play1()
	$Node4/person.show()


func _on_Button7_pressed():
	hide()
	show()
	GlobalBase.play1()
	$Node11/person.show()


func _on_Button8_pressed():
	hide()
	show()
	GlobalBase.play1()
	$Node9/person.show()


func _on_Button9_pressed():
	hide()
	show()
	GlobalBase.play1()
	$Node8/person.show()

func _on_Button10_pressed():
	hide()
	show()
	GlobalBase.play1()
	$Node10/person.show()


func _on_Button11_pressed():
	hide()
	show()
	GlobalBase.play1()
	$Node5/person.show()


func _on_Button12_pressed():
	hide()
	show()
	GlobalBase.play1()
	$Node6/person.show()


func _on_Button13_pressed():
	hide()
	show()
	GlobalBase.play1()
	$Node7/person.show()
