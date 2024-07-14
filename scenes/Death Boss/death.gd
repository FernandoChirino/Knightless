extends CharacterBody2D

@export var SPEED : float 
@export var health : int 
@export var gravity : int 

func _physics_process(delta):
	
	velocity.y += gravity 
	
	move_and_slide()
