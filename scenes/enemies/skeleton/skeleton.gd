extends CharacterBody2D

@export var player : CharacterBody2D
@export var gravity = 100 
@export var speed : int 

func _physics_process(_delta):
	velocity.y += gravity
	move_and_slide()
