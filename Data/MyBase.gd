extends Node2D

func _ready():
	hide()
	show()

func _process(delta):
	$Label.text = "$ " + String(GlobalBase.val)
	if GlobalBase.ups[0] < 10:
		$Label2.text = "Cost: " + String(1000 + (1500 * GlobalBase.ups[0])) + " Lvl: " + String(GlobalBase.ups[0] + 1) + " Hp: " + String(1000 + (100 * GlobalBase.ups[0])) + " Income: " + String(5 + (10 * GlobalBase.ups[0])) + " Max money: " + String(500 + (250 * GlobalBase.ups[0]))
	else:
		$Label2.text = "Lvl: Max" + " Hp: " + String(1000 + (100 * GlobalBase.ups[0])) + " Income: " + String(5 + (10 * GlobalBase.ups[0])) + " Max money: " + String(500 + (250 * GlobalBase.ups[0]))
	if GlobalBase.ups[1] < 10:
		$Label3.text = "Cost: " + String(500 + (1000 * GlobalBase.ups[1])) + " Lvl: " + String(GlobalBase.ups[1] + 1) + " Hp: " + String(50 + (15 * GlobalBase.ups[1])) + " Power: " + String(10 + (10 * GlobalBase.ups[1]))
	else:
		$Label3.text = "Lvl: Max" + " Hp: " + String(50 + (15 * GlobalBase.ups[1])) + " Power: " + String(10 + (10 * GlobalBase.ups[1]))
	if GlobalBase.ups[2] < 10:
		$Label4.text = "Cost: " + String(1000 + (1250 * GlobalBase.ups[2])) + " Lvl: " + String(GlobalBase.ups[2] + 1) + " Hp: " + String(80 + (20 * GlobalBase.ups[2])) + " Power: " + String(20 + (15 * GlobalBase.ups[2]))
	else:
		$Label4.text = "Lvl: Max" + " Hp: " + String(80 + (20 * GlobalBase.ups[2])) + " Power: " + String(20 + (15 * GlobalBase.ups[2]))
	if GlobalBase.ups[3] < 10:
		$Label5.text = "Cost: " + String(1500 + (1000 * GlobalBase.ups[3])) + " Lvl: " + String(GlobalBase.ups[3] + 1) + " Hp: " + String(200 + (15 * GlobalBase.ups[3])) + " Power: " + String(80 + (15 * GlobalBase.ups[3]))
	else:
		$Label5.text = "Lvl: Max" + " Hp: " + String(200 + (15 * GlobalBase.ups[3])) + " Power: " + String(80 + (15 * GlobalBase.ups[3]))
	if GlobalBase.ups[4] < 10:
		$Label6.text = "Cost: " + String(2000 + (1500 * GlobalBase.ups[4])) + " Lvl: " + String(GlobalBase.ups[4] + 1) + " Hp: " + String(180 + (5 * GlobalBase.ups[4])) + " Power: " + String(100 + (10 * GlobalBase.ups[4]))
	else:
		$Label6.text = "Lvl: Max" + " Hp: " + String(180 + (5 * GlobalBase.ups[4])) + " Power: " + String(100 + (10 * GlobalBase.ups[4]))
	if GlobalBase.ups[5] < 10:
		$Label7.text = "Cost: " + String(2500 + (2000 * GlobalBase.ups[5])) + " Lvl: " + String(GlobalBase.ups[5] + 1) + " Hp: " + String(200 + (25 * GlobalBase.ups[5])) + " Power: " + String(120 + (20 * GlobalBase.ups[5]))
	else:
		$Label7.text = "Lvl: Max" + " Hp: " + String(200 + (25 * GlobalBase.ups[5])) + " Power: " + String(120 + (20 * GlobalBase.ups[5]))
	
	
func _on_Back_pressed():
	GlobalBase.play1()
	GlobalBase.save_game()
	get_tree().change_scene("res://Data/BaseMenu.tscn")

func show():
	for i in range(0, 4):
		if GlobalBase.unlock[i]:
			if i == 0:
				$Button3.disabled = false
				$Label4.show()
			elif i == 1:
				$Button4.disabled = false
				$Label5.show()
			elif i == 2:
				$Button5.disabled = false
				$Label6.show()
			elif i == 3:
				$Button6.disabled = false
				$Label7.show()

func hide():
	$Button3.disabled = true
	$Button4.disabled = true
	$Button5.disabled = true
	$Button6.disabled = true
	$Label4.hide()
	$Label5.hide()
	$Label6.hide()
	$Label7.hide()
	


func _on_Button_pressed():
	if GlobalBase.val >= (1000 + (1500 * GlobalBase.ups[0])) and GlobalBase.ups[0] < 10:
		GlobalBase.val -= (1000 + (1500 * GlobalBase.ups[0]))
		GlobalBase.ups[0] += 1


func _on_Button2_pressed():
	if GlobalBase.val >= (500 + (1000 * GlobalBase.ups[1])) and GlobalBase.ups[1] < 10:
		GlobalBase.val -= (500 + (1000 * GlobalBase.ups[1]))
		GlobalBase.ups[1] += 1


func _on_Button3_pressed():
	if GlobalBase.val >= (1000 + (1250 * GlobalBase.ups[2])) and GlobalBase.ups[2] < 10:
		GlobalBase.val -= (1000 + (1250 * GlobalBase.ups[2]))
		GlobalBase.ups[2] += 1

func _on_Button4_pressed():
	if GlobalBase.val >= (1500 + (1000 * GlobalBase.ups[3])) and GlobalBase.ups[3] < 10:
		GlobalBase.val -= (1500 + (1000 * GlobalBase.ups[3]))
		GlobalBase.ups[3] += 1

func _on_Button5_pressed():
	if GlobalBase.val >= (2000 + (1500 * GlobalBase.ups[4])) and GlobalBase.ups[4] < 10:
		GlobalBase.val -= (2000 + (1500 * GlobalBase.ups[4]))
		GlobalBase.ups[4] += 1

func _on_Button6_pressed():
	if GlobalBase.val >= (2500 + (2000 * GlobalBase.ups[5])) and GlobalBase.ups[5] < 10:
		GlobalBase.val -= (2500 + (2000 * GlobalBase.ups[5]))
		GlobalBase.ups[5] += 1
