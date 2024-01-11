extends Node

class_name LightningManager

const MATH_CONSTANT_E = 2.718282
const CHECK_LIGHTNING_TIME = 1.0 #1 second

@export var tower : Tower
@export var protection : Value

var time = 0

func _process(delta):
	time += delta
	if time > CHECK_LIGHTNING_TIME:
		check_lightning()
		time = 0

func check_lightning():
	var probability = get_lightning_probability()
	var dice = RandomNumberGenerator.new().randf_range(0.0, 1.0)
	
	if dice < probability:
		tower.remove_floor()

func get_lightning_base_probability():
	var a = pow(MATH_CONSTANT_E, (tower.get_height()/10.0)) # e^(x/10)
	var b = a / 15.0 # (e^(x/10))/15
	var c = b - (1.0/5.0) # ((e^(x/10))/15) - (1/5)
	return c

func get_lightning_probability():
	return get_lightning_base_probability() - protection.total_value
