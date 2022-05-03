extends Node2D

var info
var enemy = "enemy"
var friend = "friend"
var levels = [1, 0, 0, 0, 0, 0]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_line(to_json(levels))
	save_game.close()

func load_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.READ)
	levels = parse_json(save_game.get_line())
	save_game.close()


# Called when the node enters the scene tree for the first time.
func _ready():
	load_game()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func play1():
	$Sound.play()
