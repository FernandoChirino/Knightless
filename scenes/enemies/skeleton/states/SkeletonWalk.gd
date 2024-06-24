extends State 
class_name SkeletonWalk

@onready var parent = $"../.."

func enter():
	pass 
	
func Update(_delta):
	pass
	
func Physics_Update(delta):
	$"../../AnimationPlayer".play("walk")
	parent.position  += (parent.player.position - parent.position) / parent.speed 
