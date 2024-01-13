extends State
class_name Wait

@onready var transporter = $"../.."
@onready var animation = $"../../AnimatedSprite2D"

func enter():
	transporter.moving = false
	transporter.scale.x = -1
	animation.play("Idle")
	

func physics_update(delta):
	if (transporter.quarry.stone_pile.size() > 0):
		transporter.scale.x = 1
		Transitioned.emit(self, "PickUpStone")
