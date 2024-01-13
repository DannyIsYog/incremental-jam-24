extends Node2D
class_name Miner

@onready var animation = $AnimatedSprite2D
@onready var quarry = $"../.."
@onready var timer = $Timer
@onready var main_scene = $"."

@export var mine_speed : Value
@export var mine_quantity : Value

var base_animation_speed

func _ready():
	base_animation_speed = animation.get_playing_speed()
	update_mine_speed()
	
func update_mine_speed():
	animation.speed_scale = base_animation_speed * mine_speed.total_value
	timer.wait_time = 1/animation.get_playing_speed()
	
func _on_timer_timeout():
	quarry.mine_stone(mine_quantity.total_value, global_position)
	animation.set_frame(0)
	update_mine_speed()
	timer.start(timer.wait_time)
