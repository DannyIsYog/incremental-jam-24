extends CharacterBody2D
class_name  Quarry

@onready var pile = $Pile
@onready var grab_stone_point = $GrabStonePoint
@onready var miner_spawn = $MinerSpawn
@onready var transporters = $"../../Transporters"
@onready var transporters_spawn = $"../../Transporters/SpawnPoint"

var stone_pile = []
const MAX_SIZE = 500
var backlog = 0
var miner_res = preload("res://Upgrades/miner.tres")
var transporter_res = preload("res://Upgrades/transporter.tres")
#Bool for mouse hovering the quarry
var mouse_in = false
@export var click_value : Value
@export var erosion_value : Value

#Stones to spawn
@export var stone_scene : PackedScene
@export var miner_scene : PackedScene
@export var transporter_scene : PackedScene

func _ready():
	miner_res.add_miner.connect(add_miner)
	transporter_res.add_transporter.connect(add_transporter)

#PLayer clicks on the quarry
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() && mouse_in && event.button_index == 1:
			print("Click Value:", click_value.total_value)
			mine_stone(click_value.total_value, get_global_mouse_position())
			
#TODO figure out what to do in case of shit ton of stones per sec
func mine_stone(amount, spawnPosition):
	var rng = RandomNumberGenerator.new()
	while amount > 0:
		
		#Intantiate New Stone
		var new_stone = stone_scene.instantiate() as Stone
		#Add to Pile
		pile.call_deferred("add_child", new_stone)
		stone_pile.append(new_stone)
		#Randomize Height
		new_stone.position = Vector2(spawnPosition.x, spawnPosition.y)
		#Set Erosion Value
		new_stone.erosion_value = erosion_value.total_value
		amount -= 1
		
		if stone_pile.size() > MAX_SIZE:
			print("Backlog: ", backlog)
			backlog += 1
			var delete_stone = stone_pile.pop_front()
			delete_stone.queue_free()

func _mouse_entered():
	mouse_in = true
	
func _mouse_exited():
	mouse_in = false
	
func add_miner():
	var new_miner = miner_scene.instantiate() as Miner
	miner_spawn.call_deferred("add_child", new_miner)

func add_transporter():
	var new_transporter = transporter_scene.instantiate() as Transporter
	transporters.call_deferred("add_child", new_transporter)
	new_transporter.global_position = transporters_spawn.global_position
	

