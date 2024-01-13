extends Control

var mouse_in = false

@export var upgrade : Value
@export var icon : CompressedTexture2D
@export var upgrade_name : String
@export var tool_tip : String
@export_enum("additive", "multiplier") var upgrade_type
@export_enum ("silver", "divine") var currency_type
@export var unique : bool = false
@export var bought : bool = false
@export var font : Font
@export var currency_icons : Array[CompressedTexture2D]

@onready var upgrade_icon : Sprite2D = $UpgradeIcon
@onready var currency_icon : Sprite2D = $CurrencyIcon
@onready var upgrade_name_text : RichTextLabel = $upgrade_name
@onready var next_upgrade_cost_text : RichTextLabel = $next_upgrade_cost
@onready var upgrade_level_text : RichTextLabel = $upgrade_level
@onready var area2D : Area2D = $Area2D
@onready var wallet_ui : wallet = $"../../.."

func _ready():
	var style_box = StyleBoxFlat.new()
	style_box.set_bg_color(Color("473623"))
	style_box.set_border_color(Color("d6a466"))
	style_box.set_border_width_all(2)
	style_box.set_content_margin_all(4.0)
	theme.set_stylebox("panel", "TooltipPanel", style_box)
	theme.set_color("font_color", "TooltipLabel", Color("ffe9c8"))
	theme.set_font("font", "TooltipFont", font)
	
	update_upgrade_name_text()
	update_next_upgrade_cost_text()
	update_upgrade_level_text()
	upgrade_icon.texture = icon
	currency_icon.texture = currency_icons[currency_type]
	
	update_tool_tip_text()
	

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() && mouse_in && event.button_index == 1:
			if can_buy():
				buy_upgrade()

func can_buy() -> bool:
	if unique && bought:
		return false
	if currency_type == 0:
		return wallet_ui.game_manager.silver_coins >= upgrade.get_price()
	else:
		return wallet_ui.game_manager.divine_coins >= upgrade.get_price()
	
func buy_upgrade():
	if currency_type == 0:
		wallet_ui.game_manager.remove_silver_coins(upgrade.get_price())
	else:
		wallet_ui.game_manager.remove_divine_coins(upgrade.get_price())
	update_next_upgrade_cost_text()
	update_upgrade_level_text()
	wallet_ui.update_wallet()
	bought = true
	if upgrade_type == 0:
		upgrade.upgrade_bv()
	elif upgrade_type == 1:
		upgrade.upgrade_multiplier()
	print(upgrade.total_value)
	update_tool_tip_text()

func update_upgrade_name_text():
	upgrade_name_text.text = upgrade_name

func update_next_upgrade_cost_text():
	next_upgrade_cost_text.text = "[right]" + str(upgrade.get_price())

func update_upgrade_level_text():
	upgrade_level_text.text = "[right]x" + str(upgrade.level)

func update_tool_tip_text():
	tooltip_text = tool_tip + "\nCurrent Increased by " + str(upgrade.level * upgrade.level_growth)

func _mouse_entered():
	mouse_in = true
	
func _mouse_exited():
	mouse_in = false
