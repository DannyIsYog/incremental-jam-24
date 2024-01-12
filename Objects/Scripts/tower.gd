extends Node2D

class_name Tower

@onready var current_floor_completion : float = 0.0
@onready var floors = $floors
@onready var text = $towerText
@onready var game_manager : GameManager = get_parent()
@export var floors_scene : PackedScene
@onready var starting_waypoint = $StartingWaypoint

var stone_needed_per_floor : float = 100.0
var floors_instances = []
var flip = false

@export var silver_coins_earn_rate : Value
@export var divine_coins_earn_rate : Value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("mine"):
		add_stone(1.0)
		update_text()
	if Input.is_action_just_pressed("lightning"):
		remove_floor()

func add_stone(stone_to_add : float) -> void:
	current_floor_completion += stone_to_add
	game_manager.silver_coins += stone_to_add * silver_coins_earn_rate.total_value
	print("added stone: ", stone_to_add)
	check_floor_completion()
		
func check_floor_completion() -> void:
	if current_floor_completion >= stone_needed_per_floor:
		add_floor(floors_instances.size()-1)
		current_floor_completion -= stone_needed_per_floor
		check_floor_completion()

func add_floor(floor : int) -> void:
	var temp_floor = floors_scene.instantiate() as Floor
	floors_instances.append(temp_floor)
	temp_floor.position = Vector2(0, 0 - (temp_floor.get_floor_height()-4) * floors_instances.size())
	if (flip):
		temp_floor.scale.x *= -1
		flip = false
	else:
		flip = true
	floors.call_deferred("add_child", temp_floor)

func remove_floor() -> void:
	current_floor_completion = 0
	update_text()
	
	if floors_instances.size() > 0:
		floors_instances.pop_back().queue_free()
		game_manager.divine_coins += divine_coins_earn_rate.total_value

func update_text() -> void: 
	text.text = str(current_floor_completion)

func get_height() -> int:
	return floors_instances.size()
