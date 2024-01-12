extends State
class_name GetStone

var destination
var quarry: Quarry
@onready var transporter = $"../.."
var gravity

func enter():
	quarry = get_tree().get_first_node_in_group("Quarry")
	destination = quarry.pile
	transporter.moving = true
	
func exit():
	pass

func physics_update(delta):
	var direction = destination.global_position - transporter.global_position
	
	if transporter.global_position.x >= 90:
		gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
		transporter.velocity = direction.normalized() * transporter.transporter_speed.total_value
	else: 
		gravity = 0
		transporter.velocity.x = transporter.transporter_speed.total_value
		transporter.velocity.y = gravity
	
	if transporter.global_position.y < 120:
		transporter.velocity.y += gravity * delta
		
	
