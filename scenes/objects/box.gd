extends ItemContainer

func receive_hit():
	if is_open:
		return
	
	$LidSprite.hide()
	
	for i in range( (randi() % $SpawnPositions.get_child_count()) + 1 ):
		var pos = $SpawnPositions.get_child(randi() % $SpawnPositions.get_child_count()).global_position
		open.emit(pos, self.spawn_direction)
	
	is_open = true
