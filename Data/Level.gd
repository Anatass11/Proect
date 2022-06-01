extends Node2D

var score = 10000
var stop = false

func _ready():
	hide()
	$Money.start(1)
	for i in range(0, 4):
		if GlobalBase.unlock[i]:
			if i == 0:
				$Good/Button4.show()
			if i == 1:
				$Good/Button5.show()
			if i == 2:
				$Good/Button6.show()
			if i == 3:
				$Good/Button7.show()
	if GlobalBase.chos == 1:
		GlobalBase.unlock[0] = 1
	elif GlobalBase.chos == 5:
		GlobalBase.unlock[1] = 1
	elif GlobalBase.chos == 9:
		GlobalBase.unlock[2] = 1
	elif GlobalBase.chos == 13:
		GlobalBase.unlock[3] = 1
	if GlobalBase.chos != 15:
		GlobalBase.levels[(GlobalBase.chos + 1)] = 1;
	$TextureRect.texture = GlobalBase.textures[GlobalBase.chos]
	$ColorRect.color = GlobalBase.colors[GlobalBase.chos]
	if GlobalBase.chos < 8 and GlobalBase.chos > 3:
		$Bad/Base2.show()
		$Good/Base2.show()
	elif GlobalBase.chos < 12 and GlobalBase.chos > 3:
		$Bad/Base3.show()
		$Good/Base3.show()
	elif GlobalBase.chos > 3:
		$Bad/Base4.show()
		$Good/Base4.show()

func _process(delta):
	pass

func hide():
	$Good/Button4.hide()
	$Good/Button5.hide()
	$Good/Button6.hide()
	$Good/Button7.hide()
	$Bad/Base2.hide()
	$Good/Base2.hide()
	$Bad/Base3.hide()
	$Good/Base3.hide()
	$Bad/Base4.hide()
	$Good/Base4.hide()

func _on_Button_pressed():
	GlobalBase.play1()
	for i in get_tree().get_nodes_in_group("friend"):
		i.queue_free()
	for i in get_tree().get_nodes_in_group("enemy"):
		i.queue_free()
	GlobalBase.save_game()
	GlobalBase.Music(1)
	get_tree().change_scene("res://Data/BaseMenu.tscn")



func _on_GoodCastle_death_good():
	score += 1000
	GlobalBase.win()
	$Result.text = "You Win!"
	$Score.text = "Reward: " + String(score)
	$Bad.block = true
	$Good.block = true
	$Good/Button.disabled = true
	GlobalBase.val += score


func _on_BadCastle_death_bad():
	GlobalBase.defeat()
	$Result.text = "You Lose!"
	$Bad.block = true
	$Good.block = true


func pay(cost):
	score += cost * 4
	$Good.pay(cost)



func _on_Money_timeout():
	if score > 2000 and not stop:
		score -= 1
	else:
		stop = true
	$Money.start(1)


