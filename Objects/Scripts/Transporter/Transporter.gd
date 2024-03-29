extends CharacterBody2D
class_name Transporter

var moving = false
@onready var animated_sprite_2d = $AnimatedSprite2D

@export var transporter_speed : Value
@export var transport_quantity : Value
var stone_transported = 0
var tower : Tower
var quarry : Quarry

func _ready():
	tower = get_tree().get_first_node_in_group("Tower")
	quarry = get_tree().get_first_node_in_group("Quarry")
	
func _physics_process(delta):
	if velocity.x > 0:
		animated_sprite_2d.flip_h = true
	elif velocity.x < 0:
		animated_sprite_2d.flip_h = false
		
	if moving:
		move_and_slide()
	
		
