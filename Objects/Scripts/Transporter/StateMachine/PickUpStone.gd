extends State
class_name PickUpStone

@onready var animation = $"../../AnimatedSprite2D"
@onready var transporter = $"../.."

func enter():
	print("Pick Up Stone")
	if transporter.quarry.stone_pile.size() > 0:
		animation.play("Pick_Up")
	transporter.moving = false
	
func update(delta):
	if transporter.quarry.stone_pile.size() <= 0:
			print("Im out")
			if transporter.stone_transported == 0:
				Transitioned.emit(self, "Wait")
			Transitioned.emit(self, "DeliverStone")
			
	if transporter.transport_quantity.total_value > transporter.stone_transported:
		var stone_grabbed = transporter.quarry.stone_pile.pop_back()
		if(stone_grabbed != null):
			stone_grabbed.queue_free()
			transporter.stone_transported += 1
			print("Transporting: ", transporter.stone_transported)
	else:
		Transitioned.emit(self, "DeliverStone")
	
