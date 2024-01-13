extends CharacterBody2D
class_name  Quarry

@onready var pile = $Pile
@onready var grab_stone_point = $GrabStonePoint
var stone_pile = []

#Bool for mouse hovering the quarry
var mouse_in = false

@export var click_value : Value
@export var erosion_value : Value

#Stones to spawn
@export var stone_scene : PackedScene

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

func _mouse_entered():
	mouse_in = true
	
func _mouse_exited():
	mouse_in = false
