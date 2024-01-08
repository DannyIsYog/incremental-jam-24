extends CharacterBody2D
class_name  Quarry

#Size of the pile
@export var pile_size:= 0
@onready var pile = $Pile

#Bool for mouse hovering the quarry
var mouse_in = false

#Stones to spawn
@export var stone_scene : PackedScene

#PLayer clicks on the quarry
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() && mouse_in:
			print("Click Value:", Values.click_value.total_value)
			mine_stone(Values.click_value.total_value)
			
#TODO figure out what to do in case of shit ton of stones per sec
func mine_stone(amount):
	var rng = RandomNumberGenerator.new()
	while amount > 0:
		#Intantiate New Stone
		var new_stone = stone_scene.instantiate() as Stone
		#Add to Pile
		pile.call_deferred("add_child", new_stone)
		pile_size += 1
		#Randomize Height
		rng.randomize()
		var height = rng.randf_range(-40,64)
		new_stone.position = Vector2(position.x - 65, position.y - height)
		#Set Erosion Value
		new_stone.erosion_value = Values.erosion_value.total_value
		amount -= 1
	pass

func _mouse_entered():
	mouse_in = true
	
func _mouse_exited():
	mouse_in = false
