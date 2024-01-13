extends State
class_name DeliverStone

var destination
var tower: Tower
var target_floor = 0
var target_waypoint = 0
var arrived = Mutex.new()

@onready var transporter = $"../.."
@onready var animation = $"../../AnimatedSprite2D"

func enter():
	transporter.moving = true
	if transporter.stone_transported == transporter.transport_quantity.total_value:
		animation.play("Walk_Heavy")
	else:
		animation.play("Walk_Stand")
	print("DELIVER STONE")
	tower = get_tree().get_first_node_in_group("Tower")
	if tower.floors_instances.size() > 0:
		destination = tower.floors_instances[0].waypoints[0]
	else:
		destination = tower.starting_waypoint
	target_floor = 0
	target_waypoint = 0
	
func exit():
	pass	

func update(_delta: float):
	var direction = destination.global_position - transporter.global_position
	
	if direction.length() <= 1 && arrived.try_lock():
		arrived.lock()
		if target_floor == tower.floors_instances.size():
			Transitioned.emit(self, "PlaceStone")
			
		else :
			if target_waypoint == 2:
				if target_floor + 1 == tower.floors_instances.size():
					
					Transitioned.emit(self, "PlaceStone")
					
				else:
					target_floor += 1
					target_waypoint = 0
					calc_destination(target_floor, target_waypoint)
			else:
				if target_waypoint < 2:
					target_waypoint += 1
					calc_destination(target_floor, target_waypoint)
	
	else:
		arrived.unlock()
		
	transporter.velocity = direction.normalized() * transporter.transporter_speed.total_value
	

func calc_destination(floor, waypoint):
	destination = tower.floors_instances[floor].waypoints[waypoint]
	
	
