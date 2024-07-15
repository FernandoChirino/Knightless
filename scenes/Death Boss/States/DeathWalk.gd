extends State 
class_name DeathWalk

@onready var parent = $"../.."

func enter():
	$"../../NavigationAgent2D/NavTimer".start()
	
func Update(_delta):
	if parent.hurt:
		Transitioned.emit(self, 'deathhurt')
	
func Physics_Update(delta):
	$"../../AnimationPlayer".play('idle')
	
	if parent.can_attack == true:
		parent.velocity = parent.direction * parent.SPEED * delta 
	
	if parent.distance_to_player <= 60 and parent.distance_to_player > 0 \
	and parent.can_attack == true or parent.distance_to_player >= -60 \
	and parent.distance_to_player < 0 and parent.can_attack == true:
		Transitioned.emit(self, 'deathattack')
	
func make_path():
	parent.nav_agent.target_position = parent.player.global_position

func _on_nav_timer_timeout():
	make_path()
