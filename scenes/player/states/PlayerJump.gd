extends  State
class_name PlayerJump 

@onready var parent = $"../.."

func enter():
	parent.velocity.y -= 15 * parent.gravity
	$"../PlayerRun".accel = 10.0
	
func Update(_delta):
	if parent.is_on_floor():
		Transitioned.emit(self, "playeridle")
	
func Physics_Update(_delta):
	pass
