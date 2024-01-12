extends Node

var mouse_in = false

@export var upgrade : Value
@export var icon : Sprite2D
@export var upgrade_name : String
@export_enum("additive", "multiplier") var type
@export var unique : bool = false

@onready var upgrade_name_text : RichTextLabel = $upgrade_name
@onready var next_upgrade_cost_text : RichTextLabel = $next_upgrade_cost
@onready var upgrade_level_text : RichTextLabel = $upgrade_level
@onready var area2D : Area2D = $Area2D

func _ready():
	update_upgrade_name_text()
	update_next_upgrade_cost_text()
	update_upgrade_level_text()

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() && mouse_in:
			print("Buying Upgrade")
			buy_upgrade()

func buy_upgrade():
	if type == 0:
		upgrade.upgrade_bv()
	elif type == 1:
		upgrade.upgrade_multiplier()
	update_next_upgrade_cost_text()
	update_upgrade_level_text()

func update_upgrade_name_text():
	upgrade_name_text.text = upgrade_name

func update_next_upgrade_cost_text():
	next_upgrade_cost_text.text = str(upgrade.get_price()) + "€"

func update_upgrade_level_text():
	upgrade_level_text.text = "x" + str(upgrade.level)

func _mouse_entered():
	mouse_in = true
	
func _mouse_exited():
	mouse_in = false
