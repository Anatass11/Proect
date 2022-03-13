extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cd2 = true
var friend = preload("res://Data/GoogUnit.tscn") 


func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("spawnH") and cd2:
		var f = friend.instance()
		f.position = $SpawnPos.position
		add_child(f)
		cd2 = false
		$CD.start(2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CD_timeout():
	cd2 = true
