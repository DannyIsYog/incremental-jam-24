extends Resource
class_name Value

@export var base_value = 1.0
@export var multiplier_value = 1.0
@export var total_value = 1.0

@export var level = 1.0

@export var start_price = 1.0
@export var upgrade_bv_growth = 1.0
@export var upgrade_multiplier_growth = 1.0
@export var level_growth = 1.0

func update_bv(value):
	base_value = base_value + value
	updateTotalValue()
	
func update_multiplier(value):
	multiplier_value = multiplier_value + value
	updateTotalValue()
	
func _ready():
	updateTotalValue()
	
func updateTotalValue():
	total_value = base_value * multiplier_value

func upgrade_bv():
	level += 1
	update_bv(upgrade_bv_growth)

func upgrade_multiplier():
	level += 1
	update_multiplier(upgrade_multiplier_growth)

func get_price():
	return (start_price * (level * level_growth)) + pow(level, 2.0)
