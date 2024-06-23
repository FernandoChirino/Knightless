extends State
class_name PlayerAttack1

@onready var parent = $"../.."
@onready var machine = $".."


func enter():
	parent.velocity.x = 0 
	$"../../AnimationPlayer".play('attack_1')

func Physics_Update(_delta):
	if machine.attack_1_finished:
		Transitioned.emit(self, 'playerattack2')
