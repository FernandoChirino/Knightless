extends State 
class_name SkeletonIdle 

@onready var parent = $"../.."
@onready var machine = $".."

func enter():
	pass 
	
func Update(_delta):
	pass
	
func Physics_Update(_delta):
	$"../../AnimationPlayer".play("idle")
	

func _on_detection_area_body_entered(body):
	if body.name == 'PKnight_state': 
		Transitioned.emit(self, 'skeletonreact')
