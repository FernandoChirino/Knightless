extends CharacterBody2D

signal DeathDirection

@onready var nav_agent = $NavigationAgent2D

@export var SPEED : float 
@export var health : int 
@export var gravity : int 
@export var player : CharacterBody2D
@export var health_max : int 

var health_min = 0 
var direction 
var distance_to_player 
var hurt = false 
var can_attack = true 

func _physics_process(_delta):
	velocity.y += gravity 
	
	direction = to_local(nav_agent.get_next_path_position()).normalized()
	distance_to_player = global_position.x - player.global_position.x
	
	if direction.x < 0:
		$Sprite2D.flip_h = true 
		$DeathAttack_1Area2D/Attack_1Collision.position.x = -29.5
	else:
		$Sprite2D.flip_h = false 
		$DeathAttack_1Area2D/Attack_1Collision.position.x = 29.5
		
	DeathDirection.emit(direction)
		
	move_and_slide()


func _on_death_hitbox_area_area_entered(area):
	if area.name == 'PKAttackHitBoxArea':
		hurt = true 
		$StateMachine.on_child_transition($StateMachine/DeathIdle, 'deathhurt')

func _on_attack_timer_timeout():
	can_attack = true 
