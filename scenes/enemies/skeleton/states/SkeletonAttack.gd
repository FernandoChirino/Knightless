extends State 
class_name SkeletonAttack

@onready var parent = $"../.."

func enter():
	parent.velocity.x = 0
	$"../../AnimationPlayer".play('attack_1')
	
func Update(_delta):
	pass
	
func Physics_Update(_delta):
	if not $"../../AnimationPlayer".is_playing():
		Transitioned.emit(self, 'skeletonwalk')
