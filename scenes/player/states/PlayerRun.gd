extends State 
class_name PlayerRun 

@onready var parent = $"../.."
@onready var sprite = $"../../Sprite2D"
@onready var machine = $".."
var accel : float = 4.0
 

func Update(_delta):
	# CHANGE TO SLIDE IF KEY IS PRESSED 
	if Input.is_action_just_pressed("slide"):
		Transitioned.emit(self, 'playerslide')
		
	# CHANGE TO ATTACK 
	if Input.is_action_just_pressed("attack_1") and machine.current_state.name != 'PlayerSlide':
		Transitioned.emit(self, 'playerattack1')

func Physics_Update(delta):
	# HORIZONTAL MOVEMENT 
	var x_input = Input.get_axis("left","right")
	if x_input:
		parent.velocity.x = lerp(parent.velocity.x, parent.SPEED * x_input, accel * delta) 
	else: 
		parent.velocity.x = move_toward(parent.velocity.x, 0, parent.SPEED)
		
	# PLAY THE RUNNNIG ANIMATION 
	if parent.velocity.x < 0 or parent.velocity.x > 0:
		$"../../AnimationPlayer".play("run")
		flip_sprite(x_input)
	else: Transitioned.emit(self, 'playeridle')
	
	
func flip_sprite(direction):
	if direction < 0:
		sprite.flip_h = true
		$"../../AttackHitBoxArea".position.x = -22.5
	else: 
		sprite.flip_h = false 
		$"../../AttackHitBoxArea".position.x = 22.5
		
