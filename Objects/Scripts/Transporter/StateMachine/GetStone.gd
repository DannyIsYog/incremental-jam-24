extends State
class_name GetStone

var destination
var quarry: Quarry
@onready var transporter = $"../.."
var gravity
@onready var animation = $"../../AnimatedSprite2D"

func enter():
	print("GET STONE")
	quarry = get_tree().get_first_node_in_group("Quarry")
	destination = quarry.grab_stone_point
	transporter.moving = true
	animation.play("Walk_Empty")
	
func exit():
	pass

func physics_update(delta):
	var direction = destination.global_position - transporter.global_position
	
	if transporter.global_position.x >= 190:
		gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * 5
		transporter.velocity = direction.normalized() * transporter.transporter_speed.total_value
	else: 
		gravity = 0
		transporter.velocity.x = transporter.transporter_speed.total_value
		transporter.velocity.y = gravity
	
	if transporter.global_position.y < 240:
		transporter.velocity.y += gravity * delta
	
	if direction.length() < 1:
		Transitioned.emit(self, "PickUpStone")
		
	
