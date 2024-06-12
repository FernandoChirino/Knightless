extends CharacterBody2D


@export var SPEED = 0

@onready var player_sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

enum state {RUNNING, IDLE, SLIDING}
var player_state = state.IDLE
var sliding_finished = false 

func _physics_process(delta):
	var left = Input.is_action_pressed("left")
	var right = Input.is_action_pressed("right")
	var doslide = Input.is_action_just_pressed("slide")
	
	
	if player_state != state.SLIDING:
		movement_flip(delta, left, right)
	handle_slide(delta, doslide)
	update_animation()

	move_and_slide()
func movement_flip(delta, left, right):
	if left:
		velocity.x = -1 * SPEED * delta 
		player_state = state.RUNNING
		player_sprite.flip_h = true
	elif right: 
		velocity.x = 1 * SPEED * delta 
		player_state = state.RUNNING
		player_sprite.flip_h = false 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
func update_animation():
	match(player_state):
		state.IDLE:
			animation_player.play("idle")
		state.RUNNING:
			animation_player.play("run")
		state.SLIDING:
			animation_player.play("slide")
			
func handle_slide(delta, doslide):
	if velocity.x == 0:
		player_state = state.IDLE
		sliding_finished = false 
	elif doslide: 
		player_state = state.SLIDING
		velocity.x = velocity.x * 100.5 * delta 
	
	if sliding_finished:
		velocity.x = 0 

func _on_animation_player_animation_finished(anim_name):
	if anim_name == 'slide': 
		sliding_finished = true 
