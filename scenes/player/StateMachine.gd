extends Node

var current_state: State 
var states: Dictionary = {}
var slide_anim_finished = false 
var attack_1_finished = false 
var attack_2_finished = false 

@export var initial_state: State

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
		
		if initial_state:
			initial_state.enter()
			current_state = initial_state

func _process(delta):
	if current_state:
		current_state.Update(delta)
		
func _physics_process(delta):
	if current_state:
		current_state.Physics_Update(delta)

func on_child_transition(state, new_state_name):
	if state != current_state:
		return 
		
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return 
		
	if current_state: 
		current_state.exit()
		
	new_state.enter()
	current_state = new_state


func _on_animation_player_animation_finished(anim_name):
	if anim_name == 'slide' or anim_name == 'slide_hitbox_left':
		slide_anim_finished = true 
	if anim_name == 'attack_1':
		attack_1_finished = true 

