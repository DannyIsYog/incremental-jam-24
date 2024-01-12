extends State
class_name PickUpStone

@onready var animation = $AnimatedSprite2D

func enter():
	pick_up_stone()
	
func update(_delta: float):
	if animation.animation_finished:
		Transitioned.emit(self, "DeliverStone")
	
func pick_up_stone():
	animation.play("Pick_Up")
	
