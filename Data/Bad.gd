extends Node2D


var block = false
var cd1 = true
var cd2 = true
var enemy = preload("res://Data/BadUnit.tscn")
var ability = preload("res://Data/Ability.tscn")
var maxm = 500
var money = 0
var mess
var n = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$Money.start(0.5)

func _process(delta):
	mess = "" + String(money) + "/" + String(maxm) + "\n"
	$Label.text = mess
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CD_timeout():
	cd1 = true
	if not block:
		$Button.disabled = false

func _on_Money_timeout():
	if money != maxm:
		money += 5
	$Money.start(0.5)

func pay(cost):
	if (money + cost) > maxm:
		money = maxm
	else:
		 money += cost

func _on_Button_pressed():
	if cd1 and money >= 50 and not block:
		var e = enemy.instance()
		if n == 1:
			e.position = $SpawnPos.position
			n = 2
		elif n == 2:
			e.position = $SpawnPos2.position
			n = 3
		else:
			e.position = $SpawnPos3.position
			n = 1
		add_child(e)
		cd1 = false
		money -= 50
		$CD.start(2)
		$Button.disabled = true


func _on_Button2_pressed():
	if cd2 and not block:
		var x = ability.instance()
		x.position = $SpawnPos3.position
		add_child(x)
		cd2 = false
		$CD2.start(20)
		$Button2.disabled = true


func _on_CD2_timeout():
	cd2 = true
	if not block:
		$Button.disabled = false
