extends CharacterBody2D
class_name Stone

const SPEED = 100.0

var direction:= 0
var speed:= 0
var erosion_value:= 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	var rng = RandomNumberGenerator.new()
	velocity.x = rng.randf_range(-30,30)
	velocity.y = rng.randf_range(-80,-130)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())/1.5
	
		

	
