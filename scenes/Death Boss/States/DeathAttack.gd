extends State 
class_name DeathAttack

@onready var parent = $"../.."

func enter():
	parent.velocity.x = 0 
	$"../../AnimationPlayer".play('attack')

func exit():
	$"../../AttackTimer".start()

func _on_animation_player_animation_finished(anim_name):
	if anim_name == 'attack':
		parent.can_attack = false 
		Transitioned.emit(self, 'deathwalk')
