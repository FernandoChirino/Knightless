extends Node2D

@onready var player : Player = $PKnight_state

var barrier_on = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if barrier_on != true:
		player.barrrier_1_on = false 
		
	if player.position.y > 2165 and barrier_on:
		player.position = Vector2(139, 232)
		player.health -= 1
	elif player.position.y > 2165 and barrier_on == false:
		player.position = Vector2(1221, 289)
		player.health -= 1
		
func _on_magic_stone_1_area_entered(area):
	if area.name == 'PKAttackHitBoxArea':
		barrier_on = false 
		$Interactables/MagicStone1.queue_free()
		$Interactables/Barrier1.queue_free()



		
