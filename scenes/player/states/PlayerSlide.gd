extends State 
class_name PlayeSlide  

@onready var parent = $"../.."
@onready var machine = $".."

func Physics_Update(delta):
	if parent.velocity.x > 0:
		parent.position.x += 10 * delta 
		$"../../AnimationPlayer".play('slide')
	else: 
		parent.position.x -= 10 * delta 
		$"../../AnimationPlayer".play('slide_hitbox_left')
		
	
	if machine.slide_anim_finished:
		Transitioned.emit(self, 'playeridle')
		machine.slide_anim_finished = false 
