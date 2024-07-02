extends State
class_name PlayerDeath 

@onready var parent = $"../.."

func enter():
	$"../../AnimationPlayer".play('death')
