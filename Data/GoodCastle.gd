extends StaticBody2D
signal death_good

const maxhp = 3000.0
var hp = maxhp as float
var damaged = 0
var part = 0
var dead = false
var clas = 0

func reducehp(damage):
	if not dead:
		hp -= damage
		#damaged += damage
		if(hp <= 0):
			hp = 0
			emit_signal('death_good')
			dead = true
		part = 10.0 * hp / maxhp
		$HpBar/red_line.scale.x = part
		$HpBar/Label.text = String(hp) + "/" + String(maxhp)

func _ready():
	add_to_group("enemy")
	$HpBar/red_line.scale.x = 10
	#damaged = 0
	dead = false
	hp = maxhp
	part = maxhp/10
	$HpBar/Label.text = String(hp) + "/" + String(maxhp)
