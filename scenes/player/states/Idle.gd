extends State 
class_name PlayerIdle 

@onready var parent = $"../.."
@onready var machine = $".."

func enter():
	parent.velocity.x = 0 
	
func Update(_delta):
	if Input.is_action_pressed('left') or Input.is_action_pressed('right'):
		Transitioned.emit(self, 'playerrun')
	
	# CHANGE TO ATTACK 
	if Input.is_action_just_pressed("attack_1") and machine.current_state.name != 'PlayerSlide':
		Transitioned.emit(self, 'playerattack1')
	
func Physics_Update(_delta):
	$"../../AnimationPlayer".play('idle')
	
	
