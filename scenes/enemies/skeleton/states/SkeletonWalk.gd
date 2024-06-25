extends State 
class_name SkeletonWalk

@onready var parent = $"../.."
@onready var nav_agent = $"../../NavigationAgent2D"

func enter():
	$"../../NavigationAgent2D/NavigationTimer".start()
	
func Update(_delta):
	pass
	
func Physics_Update(_delta):
	var direction = parent.to_local(nav_agent.get_next_path_position()).normalized()
	
	$"../../AnimationPlayer".play("walk")
	parent.velocity = direction * parent.speed
	
	if direction.x < 0:
		$"../../Sprite2D".flip_h = true
	else: 
		$"../../Sprite2D".flip_h = false 
		
func make_path():
	nav_agent.target_position = parent.player.global_position

func _on_navigation_timer_timeout():
	make_path()
