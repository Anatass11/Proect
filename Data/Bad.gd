extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cd1 = true
var enemy = preload("res://Data/BadUnit.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("spawnE") and cd1:
		var e = enemy.instance()
		e.position = $SpawnPos.position
		add_child(e)
		cd1 = false
		$CD.start(2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CD_timeout():
	cd1 = true
