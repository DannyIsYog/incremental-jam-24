extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var quarry = $".."
@onready var timer = $Timer

func _ready():
	update_mine_speed()
	
func update_mine_speed():
	animated_sprite_2d.speed_scale = animated_sprite_2d.get_playing_speed() * Values.mine_speed.total_value
	timer.wait_time = 1/animated_sprite_2d.get_playing_speed()
	
func _on_timer_timeout():
	quarry.mine_stone(Values.mine_speed.total_value)
	timer.start()
	
