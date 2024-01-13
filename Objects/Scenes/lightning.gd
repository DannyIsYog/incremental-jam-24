extends Node2D
class_name Lightning
@onready var animation = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("Lightning")

func _on_animated_sprite_2d_animation_finished():
	queue_free()
