extends State 
class_name DeathWalk

@onready var parent = $"../.."

func enter():
	$"../../NavigationAgent2D/NavTimer".start()
	
func Update(_delta):
	pass 
	
func Physics_Update(delta):
	$"../../AnimationPlayer".play('idle')
	
	parent.velocity = parent.direction * parent.SPEED * delta 
	
	if parent.distance_to_player <= 40 and parent.distance_to_player > 0 \
	or parent.distance_to_player >= -40 and parent.distance_to_player < 0 :
		Transitioned.emit(self, 'deathattack')
	
func make_path():
	parent.nav_agent.target_position = parent.player.global_position

func _on_nav_timer_timeout():
	make_path()
