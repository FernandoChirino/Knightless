extends CharacterBody2D
class_name Player 

@export var SPEED: float
@export var health = 10 
@export var gravity = 100   

var hurt = false 
var Skeleton_dir
var can_jump = false
var barrrier_1_on = true

func _physics_process(_delta):
	velocity.y += gravity
	$Label.text = str(health) 
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
	if area.name == 'SKAttackArea':
		hurt = true 
		$StateMachine.on_child_transition($StateMachine/PlayerIdle, 'playerhurt')


func _on_skeleton_skeleton_dir(sk_dir):
	Skeleton_dir = sk_dir


func _on_boss_area_area_entered(area):
	print(area.name)
	if area.name == 'PKHitboxArea':
		$BasicLight.enabled = false
