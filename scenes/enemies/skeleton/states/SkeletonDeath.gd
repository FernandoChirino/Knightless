extends State
class_name SkeletonDeath

@onready var parent = $"../.."

func enter():
	$"../../AnimationPlayer".play('death')
	
func Update(_delta):
	if not $"../../AnimationPlayer".is_playing():
		parent.queue_free()
