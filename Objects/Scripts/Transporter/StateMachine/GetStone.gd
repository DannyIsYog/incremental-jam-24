extends State
class_name GetStone

var destination
var quarry: Quarry

func enter():
	quarry = get_tree().get_first_node_in_group("Quarry")
	
func exit():
	pass
	
func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass
