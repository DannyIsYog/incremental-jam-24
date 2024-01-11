extends Node

var mouse_in = false

@export var upgrade : Value

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() && mouse_in:
			print("Buying Upgrade")
			upgrade.upgrade_bv()

func _mouse_entered():
	mouse_in = true
	
func _mouse_exited():
	mouse_in = false
