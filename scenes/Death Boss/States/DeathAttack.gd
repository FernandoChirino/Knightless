extends State 
class_name DeathAttack

@onready var parent = $"../.."

func enter():
	parent.velocity.x = 0 
	$"../../AnimationPlayer".play('attack')
	
func Update(_delta):
	if not $"../../AnimationPlayer".is_playing():
		Transitioned.emit(self, 'deathwalk')
	
func Physics_Update(_delta):
	pass
