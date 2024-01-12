extends State
class_name ExitTower

var destination
@onready var transporter = $"../.."

func enter():
	destination = transporter.quarry
	transporter.moving = true

func physics_update(_delta : float):
	var direction = destination.global_position - transporter.global_position
	transporter.velocity = direction.normalized() * transporter.transporter_speed.total_value
