extends CharacterBody2D


@export var SPEED = 0

@onready var player_sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var left = Input.is_action_pressed("left")
	var right = Input.is_action_pressed("right")
	
	movement_flip(delta, left, right)
	move_and_slide()

func movement_flip(delta, left, right):
	if left:
		velocity.x = -1 * SPEED * delta 
		animation_player.play("run")
		player_sprite.flip_h = true
	elif right: 
		velocity.x = 1 * SPEED * delta 
		animation_player.play("run")
		player_sprite.flip_h = false 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation_player.play("idle")
