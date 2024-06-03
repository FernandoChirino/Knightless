extends CharacterBody2D


@export var SPEED = 0

@onready var player_sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var horizontal_dir = Input.get_axis("left", "right")
	
	movement(delta, horizontal_dir)
	flip(horizontal_dir)

	move_and_slide()

func movement(delta, horizontal_dir):
	if horizontal_dir:
		velocity.x = horizontal_dir * SPEED * delta 
		animation_player.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation_player.play("idle")

func flip(horizontal_dir):
	if horizontal_dir < 0:
		player_sprite.flip_h = true 
	else: 
		player_sprite.flip_h = false
		
