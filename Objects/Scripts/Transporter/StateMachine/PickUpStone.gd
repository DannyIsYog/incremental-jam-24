extends State
class_name PickUpStone

@onready var animation = $"../../AnimatedSprite2D"
@onready var transporter = $"../.."
var picked_up = false

func enter():
	print("Pick Up Stone")
	picked_up = false
	if transporter.quarry.stone_pile.size() > 0:
		animation.play("Pick_Up")
	transporter.moving = false
	
func update(delta):
	if transporter.quarry.stone_pile.size() <= 0:
			print("Im out")
			if transporter.stone_transported == 0:
				Transitioned.emit(self, "Wait")
			elif picked_up:
				Transitioned.emit(self, "DeliverStone")
			
	if transporter.transport_quantity.total_value > transporter.stone_transported:
		var stone_grabbed = transporter.quarry.stone_pile.pop_back()
		if(stone_grabbed != null):
			stone_grabbed.queue_free()
			transporter.stone_transported += 1
	else:
		if picked_up: 
			Transitioned.emit(self, "DeliverStone")
	


func _on_animated_sprite_2d_animation_finished():
	if animation.animation == "Pick_Up":
		picked_up = true
