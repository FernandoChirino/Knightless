extends CharacterBody2D

@export var player : CharacterBody2D
@export var gravity = 100 
@export var speed : int 
@export var health : int 
@export var health_max : int  

signal Skeleton_dir 

@onready var nav_agent = $NavigationAgent2D
@onready var distance_to_player 

var health_min = 0 
var direction 
var hurt = false 

func _physics_process(_delta):
	velocity.y += gravity
	
	direction = to_local(nav_agent.get_next_path_position()).normalized()
	distance_to_player = global_position.x - player.global_position.x
	
	
	if direction.x < 0:
		$Sprite2D.flip_h = true
		$SKAttackArea/Attack.position.x = -46.5
	else: 
		$Sprite2D.flip_h = false 
		$SKAttackArea/Attack.position.x = 46.5
	move_and_slide()
	
	Skeleton_dir.emit(direction)

func _on_hit_box_area_area_entered(area):
	if area.name == 'PKAttackHitBoxArea':
		hurt = true 
		$StateMachine.on_child_transition($StateMachine/SkeletonIdle, 'skeletonhurt')
