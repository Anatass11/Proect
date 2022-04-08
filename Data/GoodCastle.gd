extends StaticBody2D
signal death_good

const maxhp = 3000
var hp = maxhp

func heat(damage):
	hp -= damage
	if(hp <= 0):
		hp = 0
		emit_signal('death_good')
	$HpBar/red_line.scale.x = hp/maxhp * 10

func _ready():
	$HpBar/red_line.scale.x = 10
	hp = maxhp
