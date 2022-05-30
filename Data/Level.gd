extends Node2D

var score = 10000
var stop = false

func _ready():
	$Money.start(1)
	GlobalBase.levels[1] = 1;
	pass # Replace with function body.

func _process(delta):
	pass

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
	$Result.text = "You Win!"
	$Score.text = "Reward: " + String(score)
	$Bad.block = true
	$Good.block = true
	$Good/Button.disabled = true
	GlobalBase.val += score


func _on_BadCastle_death_bad():
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
