extends State 
class_name PlayerHurt 

@onready var parent = $"../.."

func enter():
	$"../../AnimationPlayer".play('hurt')
	parent.health -= 1 
	parent.hurt = false 
	if parent.Skeleton_dir.x < 0 or parent.Death_dir.x < 0:
		parent.position -= Vector2(20, 10)
	else:
		parent.position += Vector2(20, 10)
		
func Update(_delta):
	if not $"../../AnimationPlayer".is_playing():
		Transitioned.emit(self, 'playeridle')
		
	if parent.health <= 0:
		Transitioned.emit(self, 'playerdeath')
	
func Physics_Update(_delta):
	pass
