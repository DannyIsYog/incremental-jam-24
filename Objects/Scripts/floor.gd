extends Node2D

class_name Floor

@onready var floor_sprite : Sprite2D = $FloorSprite

func get_floor_height() -> float:
	floor_sprite = $FloorSprite
	return floor_sprite.texture.get_height()
