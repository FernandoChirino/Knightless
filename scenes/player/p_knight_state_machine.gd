extends CharacterBody2D
class_name Player 

@export var SPEED: float = 300.0
@export var gravity = 100 

func _physics_process(_delta):
	velocity.y += gravity
	move_and_slide()
