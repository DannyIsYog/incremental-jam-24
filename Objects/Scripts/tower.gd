extends Node2D

class_name Tower

@onready var current_floor_completion : float = 0.0
@onready var floors = $floors
@onready var text = $towerText

@export var floors_scene : PackedScene

var stone_needed_per_floor : float = 100.0
var floors_instances = []

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("mine"):
		add_stone(1.0)
		update_text()
	if Input.is_action_just_pressed("lightning"):
		remove_floor()

func add_stone(stone_to_add : float) -> void:
	current_floor_completion += stone_to_add
	check_floor_completion()
		
func check_floor_completion() -> void:
	if current_floor_completion >= stone_needed_per_floor:
		add_floor(floors_instances.size()-1)
		current_floor_completion -= stone_needed_per_floor
		check_floor_completion()

func add_floor(floor : int) -> void:
	var temp_floor = floors_scene.instantiate() as Floor
	floors_instances.append(temp_floor)
	temp_floor.position = Vector2(position.x, position.y - temp_floor.get_floor_height() * floors_instances.size())
	floors.call_deferred("add_child", temp_floor)

func remove_floor() -> void:
	current_floor_completion = 0
	update_text()
	
	if floors_instances.size() > 0:
		floors_instances.pop_back().queue_free()

func update_text() -> void: 
	text.text = str(current_floor_completion)

func get_height() -> int:
	return floors_instances.size()
