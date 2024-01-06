extends Node

@export var base_value:= 1.0
@export var multiplier_value:= 1.0
@export var total_value:= 1.0

func update_bv(value):
	base_value = base_value + value
	
func update_multiplier(value):
	multiplier_value = multiplier_value + value
	
func _ready():
	updateTotalValue()
	
func updateTotalValue():
	total_value = base_value * multiplier_value
