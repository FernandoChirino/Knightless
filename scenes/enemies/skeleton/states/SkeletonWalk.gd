extends State 
class_name SkeletonWalk

@onready var parent = $"../.."
@onready var nav_agent = $"../../NavigationAgent2D"

func enter():
	$"../../NavigationAgent2D/NavigationTimer".start()
	
func Update(_delta):
	pass
	
func Physics_Update(delta):
	$"../../AnimationPlayer".play("walk")
	parent.velocity = parent.direction * parent.speed * delta 
	
	if parent.distance_to_player <= 40 and parent.distance_to_player > 0 \
	or parent.distance_to_player >= -40 and parent.distance_to_player < 0 :
		Transitioned.emit(self, 'skeletonattack')
	
func make_path():
	nav_agent.target_position = parent.player.global_position

func _on_navigation_timer_timeout():
	make_path()
