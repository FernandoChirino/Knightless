extends CharacterBody2D

@export var player : CharacterBody2D
@export var gravity = 100 
@export var speed : int 

@onready var nav_agent = $NavigationAgent2D
@onready var distance_to_player 
var direction 

func _physics_process(_delta):
	velocity.y += gravity
	
	direction = to_local(nav_agent.get_next_path_position()).normalized()
	distance_to_player = global_position.x - player.global_position.x
	
	if direction.x < 0:
		$Sprite2D.flip_h = true
		$AttackArea/Attack.position.x = -46.5
	else: 
		$Sprite2D.flip_h = false 
		$AttackArea/Attack.position.x = 46.5
		
	move_and_slide()
