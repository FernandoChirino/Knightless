extends State 
class_name SkeletonHurt

@onready var parent = $"../.."

func enter():
	$"../../AnimationPlayer".play("hurt")
	parent.health -= 1 
	parent.hurt = false 
	
func Update(_delta):
	if parent.health <= 0:
		Transitioned.emit(self, 'skeletondeath')
	
func Physics_Update(_delta):
	if not $"../../AnimationPlayer".is_playing():
		Transitioned.emit(self, 'skeletonwalk') 
	
