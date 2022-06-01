extends Node2D


var block = false
var cd1 = true
var cd2 = true
var cd3 = true
var cd4 = true
var cd5 = true
var cd6 = true
var ability = preload("res://Data/Ability.tscn")
var maxm = 500
var up
var money = 0
var mess
var n = 1
var cost
var income

# Called when the node enters the scene tree for the first time.
func _ready():
	maxm += 250 * GlobalBase.ups[0]
	cost = 250
	income = 5 + (10 * GlobalBase.ups[0])
	up = 1
	$Money.start(0.5)

func _process(delta):
	if up == 10:
		$Label2.text = "Level MAX"
	else: 
		$Label2.text = "Level " + String(up)
	$Label3.text = String(cost)
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
		money += income
	$Money.start(0.5)

func pay(cost):
	if (money + cost) > maxm:
		money = maxm
	else:
		 money += cost

func _on_Button_pressed():
	if cd1 and money >= 50 and not block:
		var e = GlobalBase.friends[0].instance()
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
		$Button2.disabled = false


func _on_Button3_pressed():
	if money >= cost and up < 10:
		money -= cost
		income += 10
		maxm += 200
		cost += 250
		up += 1


func _on_Button4_pressed():
	if cd3 and money >= 100 and not block:
		var e = GlobalBase.friends[1].instance()
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
		cd3 = false
		money -= 100
		$CD3.start(2)
		$Button4.disabled = true


func _on_Button5_pressed():
	if cd4 and money >= 125 and not block:
		var e = GlobalBase.friends[2].instance()
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
		cd4 = false
		money -= 125
		$CD4.start(2)
		$Button5.disabled = true


func _on_Button6_pressed():
	if cd5 and money >= 150 and not block:
		var e = GlobalBase.friends[3].instance()
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
		cd5 = false
		money -= 150
		$CD5.start(2)
		$Button6.disabled = true

func _on_Button7_pressed():
	if cd6 and money >= 200 and not block:
		var e = GlobalBase.friends[4].instance()
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
		cd6 = false
		money -= 200
		$CD6.start(2)
		$Button7.disabled = true


func _on_CD3_timeout():
	cd3 = true
	if not block:
		$Button4.disabled = false


func _on_CD4_timeout():
	cd4 = true
	if not block:
		$Button5.disabled = false


func _on_CD5_timeout():
	cd5 = true
	if not block:
		$Button6.disabled = false


func _on_CD6_timeout():
	cd6 = true
	if not block:
		$Button7.disabled = false
