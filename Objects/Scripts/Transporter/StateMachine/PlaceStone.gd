extends State
class_name PlaceStone
@onready var transporter = $"../.."
@onready var animation = $"../../AnimatedSprite2D"


func enter():
	print("PLACE STONE")
	transporter.moving = false
	animation.play_backwards("Pick_Up")
	
func physics_update(_delta: float):
	if animation.frame == 0:
		transporter.tower.add_stone(transporter.stone_transported)
		transporter.stone_transported = 0
		Transitioned.emit(self, "GetStone")

