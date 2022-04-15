extends Node2D


var block = false
var cd1 = true
var enemy = preload("res://Data/BadUnit.tscn")
var maxm = 500
var money = 0
var mess

# Called when the node enters the scene tree for the first time.
func _ready():
	$Money.start(0.5)

func _process(delta):
	mess = "" + String(money) + "/" + String(maxm) + "\n"
	$Label.text = mess
	if Input.is_action_just_pressed("spawnE") and cd1 and money >= 50 and not block:
		var e = enemy.instance()
		e.position = $SpawnPos.position
		add_child(e)
		cd1 = false
		money -= 50
		$CD.start(2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CD_timeout():
	cd1 = true


func _on_Money_timeout():
	if money != maxm:
		money += 5
	$Money.start(0.5)

