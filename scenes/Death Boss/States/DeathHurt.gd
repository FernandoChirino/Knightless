extends State 
class_name DeathHurt

@onready var parent = $"../.."

func enter():
	parent.health -= 1 
	$Timer.start()

func exit():
	parent.hurt = false 

func _on_timer_timeout():
	Transitioned.emit(self, 'deathwalk')
