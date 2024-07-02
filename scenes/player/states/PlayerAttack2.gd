extends State 
class_name PlayerAttack2

@onready var parent = $"../.."
@onready var machine = $".."

func enter():
	parent.velocity.x = 0 

func Physics_Update(_delta):
	if Input.is_action_just_pressed("attack_1"):
		$"../../AnimationPlayer".play('attack_2')
		
	if not $"../../AnimationPlayer".is_playing():
		Transitioned.emit(self, 'playeridle')
	

