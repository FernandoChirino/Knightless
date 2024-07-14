extends CharacterBody2D

@export var SPEED : float 
@export var health : int 
@export var gravity : int 
@export var player : CharacterBody2D

@onready var nav_agent = $NavigationAgent2D

var direction 
var distance_to_player 

func _physics_process(_delta):
	velocity.y += gravity 
	
	direction = to_local(nav_agent.get_next_path_position()).normalized()
	distance_to_player = global_position.x - player.global_position.x
	
	if direction.x < 0:
		$Sprite2D.flip_h = true 
		$Attack_1Area2D/Attack_1Collision.position.x = -29.5
	else:
		$Sprite2D.flip_h = false 
		$Attack_1Area2D/Attack_1Collision.position.x = 29.5
		
		
	move_and_slide()
