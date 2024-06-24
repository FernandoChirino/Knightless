extends State 
class_name SkeletonReact


func enter():
	$"../../AnimationPlayer".play('react')
	
func Update(_delta):
	if not $"../../AnimationPlayer".is_playing():
		Transitioned.emit(self, 'skeletonwalk')
