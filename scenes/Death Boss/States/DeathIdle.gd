extends State 
class_name DeathIdle

func Physics_Update(_delta):
	$"../../AnimationPlayer".play('idle')

func _on_detection_area_area_entered(area):
	if area.name == 'PKHitboxArea':
		Transitioned.emit(self, 'deathwalk')
