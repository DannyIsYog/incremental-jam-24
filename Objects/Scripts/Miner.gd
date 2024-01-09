extends Node2D

@onready var animation = $AnimatedSprite2D
@onready var quarry = $".."
@onready var timer = $Timer
@onready var main_scene = $"."

func _ready():
	update_mine_speed()
	
func update_mine_speed():
	animation.speed_scale = animation.get_playing_speed() * Values.mine_speed.total_value
	timer.wait_time = 1/animation.get_playing_speed()
	
func _on_timer_timeout():
	quarry.mine_stone(Values.mine_speed.total_value, global_position)
	animation.set_frame(0)
	timer.start(timer.wait_time)
