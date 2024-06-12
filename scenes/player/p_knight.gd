extends CharacterBody2D

@export var SPEED = 0

@onready var player_sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer

# PLAYER STATE 
enum state {RUNNING, IDLE, SLIDING, 
			ATTACK_1}
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player_state = state.IDLE

func _physics_process(delta):
	# INPUTS 
	var left = Input.is_action_pressed("left")
	var right = Input.is_action_pressed("right")
	var doslide = Input.is_action_just_pressed("slide")
	var attack_1 = Input.is_action_just_pressed("attack_1")
	
	
	if player_state != state.SLIDING and player_state != state.ATTACK_1:
		movement_flip(delta, left, right)
	if player_state != state.SLIDING and attack_1:
		handle_attack_1()
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
		state.ATTACK_1:
			animation_player.play("attack_1")
			
func handle_slide(delta, doslide):
	if velocity.x == 0 and player_state != state.ATTACK_1:
		player_state = state.IDLE
	elif doslide: 
		player_state = state.SLIDING
		velocity.x = velocity.x * 100.5 * delta 
	
func handle_attack_1():
	player_state = state.ATTACK_1
	velocity.x = 0 
		
func _on_animation_player_animation_finished(anim_name):
	if anim_name == 'slide': 
		velocity.x = 0 
	if anim_name == 'attack_1':
		player_state = state.IDLE 
