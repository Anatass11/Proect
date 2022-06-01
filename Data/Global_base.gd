extends Node2D

var info
var enemy = "enemy"
var friend = "friend"
var levels = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
var ups = [0, 0, 0, 0, 0, 0]
var val = 0
var textures = [
	preload("res://res/AC6sD6GnnYs.jpg"),
	preload("res://res/background2.png"),
	preload("res://res/background1.png"),
	preload("res://res/game_background_4.png"),
	preload("res://res/background1.png"),
	preload("res://res/background4.png"),
	preload("res://res/background2.png"),
	preload("res://res/background3.png"),
	preload("res://res/Battleground3.png"),
	preload("res://res/Battleground1.png"),
	preload("res://res/Battleground4.png"),
	preload("res://res/Battleground2.png"),
	preload("res://res/War1.png"),
	preload("res://res/War2.png"),
	preload("res://res/War3.png"),
	preload("res://res/War4.png") ]
var colors = [ "152c11", "a9a76c", "b1856a", "1b130e", "b1856a", "f6dea5", "a9a76c", "a58f79", "40512f", "3e663c",
	"3e483a", "a8a48d", "433e28", "242425", "302523", "1e1c1c" ]
var chos
var enemys = [
	preload("res://Data/Dino.tscn"),
	preload("res://Data/Rex.tscn"),
	preload("res://Data/Medusa.tscn"),
	preload("res://Data/Jinn.tscn"),
	preload("res://Data/Demon.tscn"),
	preload("res://Data/Dragon.tscn"),
	preload("res://Data/Robot.tscn"),
	preload("res://Data/Wraith.tscn")]
var friends = [
	preload("res://Data/Chel.tscn"),
	preload("res://Data/Big_chel.tscn"),
	preload("res://Data/Knight.tscn"),
	preload("res://Data/Mage.tscn"),
	preload("res://Data/Rogue.tscn")]
var unlock = [0, 0, 0, 0]
var set = [[0, -1, -1], [0, -1, -1], [0, 1, -1], [0, 1, -1], [0, 1, 2], [0, 1, 2], [3, 2, 0], [3, 2, 1], 
[4, 2, 0], [4, 3, 1], [5, 4, 2], [5, 1, 3], [6, 5, 1], [6, 4, 3], [7, 5, 6], [7, 4, 6]]
var cd = [5, 10, 15, 20, 15, 10, 20, 25]

func save_game():
	var save_game = File.new()
	save_game.open("res://Save/savegame.save", File.WRITE)
	save_game.store_line(to_json(levels))
	save_game.store_line(to_json(val))
	save_game.store_line(to_json(unlock))
	save_game.store_line(to_json(ups))
	save_game.close()

func load_game():
	var save_game = File.new()
	save_game.open("res://Save/savegame.save", File.READ)
	levels = parse_json(save_game.get_line())
	val = parse_json(save_game.get_line())
	unlock = parse_json(save_game.get_line())
	ups = parse_json(save_game.get_line())
	save_game.close()


# Called when the node enters the scene tree for the first time.
func _ready():
	#levels = [1, 0, 0, 0, 0, 0]
	#print(levels)
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
	
func win():
	$win.play()

func defeat():
	$defeat.play()

func Music(var i):
	if i == 1:
		$battle.stop()
		if $menu.playing != true:
			$menu.play()
	else:
		$menu.stop()
		$battle.play()

func _on_win_finished():
	Music(1)


func _on_defeat_finished():
	Music(1)
