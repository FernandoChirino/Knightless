extends CharacterBody2D
class_name Player 

@export var SPEED: float
@export var health : int 
@export var gravity = 100   
@export var health_max : int  

var health_min = 0 
var hurt = false 
var Skeleton_dir
var can_jump = false
var barrrier_1_on = true
var Death_dir 

func _physics_process(_delta):
	velocity.y += gravity
	move_and_slide()
	
	if is_on_floor():
		can_jump = true 
	else:
		can_jump = false 
		
	if barrrier_1_on: 
		$PKCamera.limit_right = 1342
	else:   
		$PKCamera.limit_right = 10000000

func _on_hitbox_area_area_entered(area):
	if area.name == 'SKAttackArea' or area.name == 'DeathAttack_1Area2D':
		hurt = true 
		$StateMachine.on_child_transition($StateMachine/PlayerIdle, 'playerhurt')

func _on_skeleton_skeleton_dir(sk_dir):
	Skeleton_dir = sk_dir

func _on_boss_area_area_entered(area):
	if area.name == 'PKHitboxArea':
		$BasicLight.enabled = false

func _on_death_death_direction(death_direction):
	Death_dir = death_direction
