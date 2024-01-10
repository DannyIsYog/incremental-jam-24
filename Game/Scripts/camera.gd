extends Node2D

@onready var tower : Tower = $"../Tower"
@onready var original_position = position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("up"):
		if tower.floors_instances.size() < 1:
			return
			
		var last_floor_y = tower.floors_instances[-1].global_position.y
		
		if last_floor_y < original_position.y:
			position.y = last_floor_y
		else:
			position = original_position

	if Input.is_action_just_pressed("down"):
		position = original_position
