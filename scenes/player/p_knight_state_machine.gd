extends CharacterBody2D
class_name Player 

@export var SPEED: float
@export var health = 10 
@export var gravity = 100   

var hurt = false 
var Skeleton_dir
var can_jump = false

func _physics_process(_delta):
	velocity.y += gravity
	$Label.text = str(health) 
	move_and_slide()
	
	if is_on_floor():
		can_jump = true 
	else:
		can_jump = false 

func _on_hitbox_area_area_entered(area):
	if area.name == 'SKAttackArea':
		hurt = true 
		$StateMachine.on_child_transition($StateMachine/PlayerIdle, 'playerhurt')


func _on_skeleton_skeleton_dir(sk_dir):
	Skeleton_dir = sk_dir
