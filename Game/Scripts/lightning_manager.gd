extends Node

class_name LightningManager

const MATH_CONSTANT_E = 2.718282
const CHECK_LIGHTNING_TIME = 1.0 #1 second

@export var tower : Tower

var time = 0

func _process(delta):
	time += delta
	if time > CHECK_LIGHTNING_TIME:
		check_lightning()
		time = 0

func check_lightning():
	print("Checking Lightning")
	var probability = get_lightning_probability()
	var dice = RandomNumberGenerator.new().randf_range(0.0, 1.0)
	
	print("Probability: " + str(probability))
	print("Dice: " + str(dice))
	
	if dice < probability:
		print("Removing Floor")
		tower.remove_floor()

func get_lightning_base_probability():
	return (pow(MATH_CONSTANT_E, tower.get_height()/10)/15)-(1/15)

func get_lightning_probability():
	return get_lightning_base_probability() - Values.protection.total_value
