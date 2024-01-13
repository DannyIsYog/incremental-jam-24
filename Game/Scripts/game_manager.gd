extends Node

class_name GameManager

@onready var silver_coins = 0
@onready var divine_coins = 0
@onready var wallet_ui : wallet = $"../Camera/CanvasLayer/UI"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_silver_coins(coins : int):
	silver_coins += coins
	wallet_ui.update_wallet()

func remove_silver_coins(coins : int):
	silver_coins -= coins
	wallet_ui.update_wallet()

func add_divine_coins(coins : int):
	divine_coins += coins
	wallet_ui.update_wallet()

func remove_divine_coins(coins : int):
	divine_coins -= coins
	wallet_ui.update_wallet()
