extends Node2D

var info
var enemy = "enemy"
var friend = "friend"
var levels = [1, 0, 0, 0, 0, 0]
var ups = [1, 1, 0, 0]
var val = 0
var chos
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func save_game():
	var save_game = File.new()
	save_game.open("res://Save/savegame.save", File.WRITE)
	save_game.store_line(to_json(levels))
	save_game.store_line(to_json(val))
	save_game.close()

func load_game():
	var save_game = File.new()
	save_game.open("res://Save/savegame.save", File.READ)
	levels = parse_json(save_game.get_line())
	val = parse_json(save_game.get_line())
	save_game.close()


# Called when the node enters the scene tree for the first time.
func _ready():
	levels = [1, 0, 0, 0, 0, 0]
	print(levels)
	#save_game()
	#load_game()
	pass # Replace with function body.


func get(var i):
	return levels[i]
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func play1():
	$Sound.play()

func Music(var i):
	if i == 1:
		$battle.stop()
		if $menu.playing != true:
			$menu.play()
	else:
		$menu.stop()
		$battle.play()

