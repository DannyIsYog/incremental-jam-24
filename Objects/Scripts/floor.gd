extends Node2D

class_name Floor

@onready var floor_sprite : Sprite2D = $FloorSprite
var waypoints = []
@onready var first_waypoint = $FirstWaypoint
@onready var second_waypoint = $SecondWaypoint
@onready var third_waypoint = $ThirdWaypoint


func _ready():
	waypoints.append(first_waypoint)
	waypoints.append(second_waypoint)
	waypoints.append(third_waypoint)

func get_floor_height() -> float:
	floor_sprite = $FloorSprite
	return floor_sprite.texture.get_height()
