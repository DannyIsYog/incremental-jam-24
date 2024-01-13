extends Node2D

@onready var tower : Tower = $"../GameManager/Tower"
@onready var original_position = position
var cam_speed = 3
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("up"):
		if tower.floors_instances.size() < 1:
			return
			
		var last_floor_y = tower.floors_instances[-1].global_position.y
		
		if last_floor_y < 0:
			position.y = last_floor_y - 39
		else:
			position = original_position

	if Input.is_action_just_pressed("down"):
		position = original_position
	
	if Input.is_action_pressed("left"):
		if position.y == original_position.y && position.x > original_position.x:
			position.x -= cam_speed
			
	if Input.is_action_pressed("right"):
		if position.y == original_position.y && position.x < 850:
			position.x += cam_speed
	
	
